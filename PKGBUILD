# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=tidygraph
_pkgver=1.3.1
pkgname=r-${_pkgname,,}
pkgver=1.3.1
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
sha256sums=('aac1d4bb9396081bbeecbde11a3cd1a26a56bd6b1f608a628b359cb37c18ac1a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
