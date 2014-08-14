checkPkgDepFunctions <- function(pkg, availPkgs = cranJuly2014, 
                                 repos = "http://cran.revolutionanalytics.com", 
                                 type="source", 
                                 suggests=TRUE, 
                                 enhances=FALSE, 
                                 includeBasePkgs=FALSE){
  p1 <- pkgDep(pkg, availPkgs=availPkgs, 
               repos=repos, type=type, 
               suggests=suggests, enhances=enhances, 
               includeBasePkgs=includeBasePkgs)
  p2 <- makeDepGraph(pkg, availPkgs=availPkgs, 
                     repos=repos, type=type, 
                     suggests=suggests, enhances=enhances, 
                     includeBasePkgs=includeBasePkgs)
  
  vnames <- V(p2)$name
  diff1 <- setdiff(vnames, p1)
  diff2 <- setdiff(p1, vnames)
  result <- length(diff1) == 0 & length(diff2) == 0
  if(!result) {
    msg <- paste0("\nmakeDepGraph() results not in pkgDep(): \n - ", paste(diff1, collapse=", "),
                  "\npkgDep() results not in makeDepGraph(): \n - ", paste(diff2, collapse=", "))
    
    warning(msg)
  }
  result
}


context("makeDepGraph ")

test_that("makeDepGraph and pgkDep gives similar results for MASS", {
  
  tag <- "MASS"
  
  expect_true(
    checkPkgDepFunctions(tag)
  )
  expect_true(
    checkPkgDepFunctions(tag, includeBasePkgs = TRUE)
  )
  expect_true(
    checkPkgDepFunctions(tag, includeBasePkgs = TRUE, suggests=FALSE)
  )
  expect_true(
    checkPkgDepFunctions(tag, includeBasePkgs = TRUE, enhances=TRUE)
  )
  
})


test_that("makeDepGraph and pgkDep gives similar results for chron", {
  
  tag <- "chron"
  
  expect_true(
    checkPkgDepFunctions(tag)
  )
  expect_true(
    checkPkgDepFunctions(tag, includeBasePkgs = TRUE)
  )
  expect_true(
    checkPkgDepFunctions(tag, includeBasePkgs = TRUE, suggests=FALSE)
  )
  expect_true(
    checkPkgDepFunctions(tag, includeBasePkgs = TRUE, enhances=TRUE)
  )
  
})


test_that("makeDepGraph and pgkDep gives similar results for data.table", {
  
  tag <- "data.table"

  expect_true(
    checkPkgDepFunctions(tag)
  )
  expect_true(
    checkPkgDepFunctions(tag, includeBasePkgs = TRUE)
  )
  expect_true(
    checkPkgDepFunctions(tag, includeBasePkgs = TRUE, suggests=FALSE)
  )
  expect_true(
    checkPkgDepFunctions(tag, includeBasePkgs = TRUE, enhances=TRUE)
  )
  
})

test_that("makeDepGraph and pgkDep gives similar results for ggplot2", {
  
  tag <- "ggplot2"

  expect_true(
    checkPkgDepFunctions(tag)
  )
  expect_true(
    checkPkgDepFunctions(tag, includeBasePkgs = TRUE)
  )
  expect_true(
    checkPkgDepFunctions(tag, includeBasePkgs = TRUE, suggests=FALSE)
  )
  expect_true(
    checkPkgDepFunctions(tag, includeBasePkgs = TRUE, enhances=TRUE)
  )
  
})


test_that("makeDepGraph and pgkDep gives similar results for complex query", {
  
  tag <- c("ggplot2", "data.table", "plyr", "knitr", "shiny", "xts", "lattice")

  expect_true(
    checkPkgDepFunctions(tag)
  )
  expect_true(
    checkPkgDepFunctions(tag, includeBasePkgs = TRUE)
  )
  expect_true(
    checkPkgDepFunctions(tag, includeBasePkgs = TRUE, suggests=FALSE)
  )
  expect_true(
    checkPkgDepFunctions(tag, includeBasePkgs = TRUE, enhances=TRUE)
  )
  
})
