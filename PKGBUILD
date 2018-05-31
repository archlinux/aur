# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=roxygen2
_cranver=6.0.1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-roxygen2
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="In-Line Documentation for R"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' 'r-stringr' 'r-stringi' 'r-brew' 'r-digest' 'r-desc' 'r-commonmark' 'r-xml2')

optdepends=('r-testthat' 'r-knitr' 'r-devtools' 'r-rmarkdown' 'r-covr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('53300ac3f27ff0998ebb5fbe3afc8b9f')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

