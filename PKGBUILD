# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=discretecdAlgorithm
_pkgver=0.0.7
pkgname=r-${_pkgname,,}
pkgver=0.0.7
pkgrel=4
pkgdesc='Coordinate-Descent Algorithm for Learning Sparse Discrete Bayesian Networks'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-igraph
  r-rcpp
  r-rcppeigen
  r-sparsebnutils
  gcc
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5a6e8d1097c4e32cb9477fb4738b4fda27b96e76b07d8453059bb723a5c3a307')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
