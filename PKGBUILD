# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=munsell
_cranver=0.4.3
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-munsell
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Utilities for Using Munsell Colours"
arch=('any')
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
license=('MIT')
depends=('r' 'r-colorspace')

optdepends=('r-ggplot2' 'r-testthat')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('ebd205323dc37c948f499ee08be9c476')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

