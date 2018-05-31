# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=praise
_cranver=1.0.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-praise
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Praise Users"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('MIT')
depends=('r' )

optdepends=('r-testthat')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('9318724cec0454884b5f762bee2da6a1')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

