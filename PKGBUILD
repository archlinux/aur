# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=TTR
_cranver=0.23-3
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-ttr
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Technical Trading Rules"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2')
depends=('r' 'r-xts' 'r-zoo' 'r-curl' 'r-xts')



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('e4c98cbec65f559ac3c1b1d168970c50')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

