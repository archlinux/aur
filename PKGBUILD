# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=startupmsg
_cranver=0.9.4
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-startupmsg
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Utilities for Start-Up Messages"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('LGPL3')
depends=('r' )



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('ca677e252cce1584071394f0b26befa4')
replaces=('r-cran-startupmsg')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

