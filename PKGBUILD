# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sparsebnUtils
_pkgver=0.0.8
pkgname=r-${_pkgname,,}
pkgver=0.0.8
pkgrel=4
pkgdesc='Utilities for Learning Sparse Bayesian Networks'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-bnlearn
  r-graph
  r-igraph
  r-network
  r-rcy3
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7a03725cebb3a6105248c5a2df6e2a9dc4c55facf382bab438918d3c468337f4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
