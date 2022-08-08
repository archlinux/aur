# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ggraph
_pkgver=2.0.6
pkgname=r-${_pkgname,,}
pkgver=2.0.6
pkgrel=1
pkgdesc='An Implementation of Grammar of Graphics for Graphs and Networks'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-digest
  r-dplyr
  r-ggforce
  r-ggplot2
  r-ggrepel
  r-graphlayouts
  r-gtable
  r-igraph
  r-rcpp
  r-rlang
  r-scales
  r-tidygraph
  r-viridis
  r-withr
)
optdepends=(
  r-covr
  r-deldir
  r-gganimate
  r-knitr
  r-network
  r-purrr
  r-rmarkdown
  r-seriation
  r-tibble
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7b0ac90d834a3ce5641b4bca159d59d09607ddaab592908361b75cffb648d40a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
