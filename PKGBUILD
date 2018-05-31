# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=bit
_cranver=1.1-14
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-bit
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="A Class for Vectors of 1-Bit Booleans"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2')
depends=('r' )



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('e62b50777478fe4dd624955cfd609fcc')
replaces=('r-cran-bit')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

