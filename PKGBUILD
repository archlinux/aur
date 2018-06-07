# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=MatrixModels
_cranver=0.4-1
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-matrixmodels
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Modelling with Sparse And Dense Matrices"
arch=('any')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL')
depends=('r' )



source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('65b3ab56650c62bf1046a3eb1f1e19a0')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

