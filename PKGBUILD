# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=reprex
_cranver=0.2.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-reprex
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Prepare Reproducible Example Code via the Clipboard"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' 'r-callr>=2.0.0' 'r-clipr>=0.4.0' 'r-rlang' 'r-rmarkdown' 'r-whisker' 'r-withr')

optdepends=('pandoc' 'r-covr' 'r-devtools' 'r-fortunes' 'r-knitr' 'r-miniui' 'r-rprojroot' 'r-rstudioapi' 'r-shiny' 'r-styler' 'r-testthat')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('52894c182b7937aa219afa75d2046d7c')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

