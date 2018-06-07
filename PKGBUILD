# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=quantreg
_cranver=5.36
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-quantreg
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Quantile Regression"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' 'r-sparsem' 'r-matrixmodels')

optdepends=('r-tripack' 'r-akima' 'r-rgl' 'r-logspline' 'r-nor1mix' 'r-formula' 'r-zoo')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('4d64dc8694c710b2ee5e373464eabce8')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

