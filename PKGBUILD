# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tidygraph
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=1.2.1
pkgrel=3
pkgdesc='A Tidy API for Graph Manipulation'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-dplyr
  r-igraph
  r-magrittr
  r-pillar
  r-r6
  r-rcpp
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
sha256sums=('2fbdc2db18c5ad48c72f14d2d04111f4b0d4c434ad87c280eda3bcb98673ad36')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
