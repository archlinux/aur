# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tidygraph
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgver=1.3.0
pkgrel=1
pkgdesc='A Tidy API for Graph Manipulation'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-cli
  r-cpp11
  r-dplyr
  r-igraph
  r-magrittr
  r-pillar
  r-r6
  r-rlang
  r-tibble
  r-tidyr
)
optdepends=(
  r-ape
  r-covr
  r-data.tree
  r-graph
  r-influencer
  r-methods
  r-netrankr
  r-netswan
  r-network
  r-seriation
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('93b314714b7d803565503f65b3b224856f83fe01686626059cb42d52ecb51487')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
