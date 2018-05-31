# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=depmix
_cranver=0.9.14
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-depmix
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Dependent Mixture Models"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL3')
depends=('r' )



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('f837ec6fe33c8ae5de9fd95956304c2b')
replaces=('r-cran-depmix')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

