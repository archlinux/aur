# Maintainer: Taekyung Kim <Taekyung.Kim.Maths@gmail.com>
# Contributor: Alex Branham <branham@utexas.edu>

_cranname=RcppEigen
_cranver=0.3.3.5.0
_pkgtar=${_cranname}_${_cranver}.tar.gz
pkgname=r-rcppeigen
pkgver=${_cranver//[:-]/.}
pkgrel=1
pkgdesc="Rcpp Integration for the Eigen Templated Linear Algebra Library"
arch=('x86_64')
url="https://cran.r-project.org/package=${_cranname}"
license=('GPL2' 'GPL3' 'custom')
depends=('r>=2.15.1' 'r-rcpp>=0.11.0')
optdepends=('r-inline' 'r-runit' 'r-pkgkitten' 'r-microbenchmark')
source=("https://cran.r-project.org/src/contrib/${_pkgtar}")
md5sums=('9ec372cea453794167b0b2773387714f')

build(){
    R CMD INSTALL "${_pkgtar}" -l "$srcdir"
}
package() {
    install -dm0755 "$pkgdir"/usr/lib/R/library
    cp -a --no-preserve=ownership "$_cranname" "$pkgdir"/usr/lib/R/library
}
