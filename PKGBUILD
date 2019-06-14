# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com
# Contributor: Kibouo <csonka.mihaly@hotmail.com>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=base64enc
_cranver=0.1-3
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-base64enc
pkgver=${_cranver//[:-]/.}
pkgrel=2
pkgdesc="Tools for base64 encoding"
arch=('i686' 'x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' )
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('0f476dacdd11a3e0ad56d13f5bc2f190')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

