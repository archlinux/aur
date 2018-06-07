# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=rex
_cranver=1.1.2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-rex
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Friendly Regular Expressions"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' 'r-magrittr' 'r-lazyeval')

optdepends=('r-testthat' 'r-knitr' 'r-rmarkdown' 'r-dplyr' 'r-ggplot2' 'r-hmisc' 'r-stringr' 'r-rvest' 'r-roxygen2' 'r-covr')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('8820b4d4fe3718f275847b6f2cf83689')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

