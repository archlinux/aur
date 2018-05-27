# Maintainer: Alex Branham <branham@utexas.edu>
_cranname=RcppEigen
_cranver=0.3.3.4.0
pkgname=r-rcppeigen
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="R and 'Eigen' integration using 'Rcpp'. "
url="https://cran.r-project.org/web/packages/${_cranname}/index.html"
arch=('x86_64')
license=('GPL')
depends=('r'
         'r-cran-cpp')
# optdepends=('r-inline' 'r-pkgkitten')
source=("https://cran.r-project.org/src/contrib/${_cranname}_${_cranver}.tar.gz")
md5sums=('78ee1ef7c6043efa875434ae5fcea2ec')
package() {
    mkdir -p ${pkgdir}/usr/lib/R/library
    cd "${srcdir}"
    R CMD INSTALL ${_cranname} -l ${pkgdir}/usr/lib/R/library
}
