# Maintainer: Alex Branham <branham@utexas.edu>
_cranver=6.1.0
pkgname=r-roxygen2
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc='In-Line Documentation for R'
arch=('x86_64')
url='https://cran.r-project.org/package=roxygen2'
license=('GPL')
depends=('r' 'r-brew' 'r-commonmark' 'r-desc' 'r-digest' 'r-pkgload' 'r-purrr' 'r-r6>=2.1.2' 'r-rcpp>=0.11.0' 'r-stringi' 'r-stringr>=1.0.0' 'r-xml2')
optdepends=('r-covr' 'r-devtools' 'r-knitr' 'r-rmarkdown' 'r-testthat')
source=("https://cran.r-project.org/src/contrib/roxygen2_"$_cranver".tar.gz")
md5sums=('fa9c1673bd1c020ae6d3ade0975af7cd')

build(){
    R CMD INSTALL roxygen2_"$_cranver".tar.gz -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership roxygen2 "$pkgdir"/usr/lib/R/library
}

