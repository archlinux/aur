# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=covr
_cranver=3.1.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-covr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Test Coverage for Packages"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' 'r-digest' 'r-jsonlite' 'r-rex' 'r-httr' 'r-crayon' 'r-withr>=1.0.2')

optdepends=('r-r6' 'r-knitr' 'r-rmarkdown' 'r-shiny' 'r-htmltools' 'r-htmlwidgets' 'r-dt' 'r-testthat' 'r-rstudioapi' 'r-xml2' 'r-memoise' 'r-mockery')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('ed550577d9e78e9d2ffafd7ae4a34b6f')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

