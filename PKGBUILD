# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=numDeriv
_cranver=2016.8-1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-numderiv
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Accurate Numerical Derivatives"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2')
depends=('r' )



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('30e486298d5126d86560095be8e8aac1')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

