# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ccdrAlgorithm
_pkgver=0.0.6
pkgname=r-${_pkgname,,}
pkgver=0.0.6
pkgrel=4
pkgdesc='CCDr Algorithm for Learning Sparse Gaussian Bayesian Networks'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
  r-sparsebnutils
)
optdepends=(
  r-graph
  r-igraph
  r-matrix
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e55e2b9a4cc39442e2621b2131f1ffba330ced0fa8fe12ae750340c0b5188b5f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
