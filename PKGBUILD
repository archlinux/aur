# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=reprex
_cranver=0.1.2
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-reprex
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Prepare Reproducible Example Code for Sharing"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' 'r-callr' 'r-knitr' 'r-rmarkdown' 'r-whisker')

optdepends=('pandoc' 'r-covr' 'r-devtools' 'r-fortunes' 'r-miniui' 'r-rstudioapi' 'r-shiny' 'r-shinyjs' 'r-testthat')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('8443e72fbb4a32bf4dae9d2df8b9dcfb')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

