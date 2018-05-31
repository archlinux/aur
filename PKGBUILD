# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=bitops
_cranver=1.0-6
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-bitops
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Bitwise Operations"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' )



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('fba16485a51b1ccd354abde5816b6bdd')
replaces=('r-cran-bitops')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

