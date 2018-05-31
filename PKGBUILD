# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=RcppEigen
_cranver=0.3.3.4.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-rcppeigen
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Rcpp Integration for the Eigen Templated Linear Algebra Library"
arch=('x86_64')
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
license=('GPL' 'custom')
depends=('r' )

optdepends=('r-inline' 'r-pkgkitten')

source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('78ee1ef7c6043efa875434ae5fcea2ec')

build(){
    R CMD INSTALL ${_pkgtar} -l $srcdir
}
package() {
    install -d "$pkgdir/usr/lib/R/library"
    cp -r "$srcdir/$_cranname" "$pkgdir/usr/lib/R/library"
}

