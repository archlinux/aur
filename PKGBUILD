# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=munsell
_cranver=0.5.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-munsell
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Utilities for Using Munsell Colours"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' 'r-colorspace')

optdepends=('r-ggplot2' 'r-testthat')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('b287f380a958399cfa12f665232e7f34')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

