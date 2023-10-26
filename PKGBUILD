# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FlowSOM
_pkgver=2.10.0
pkgname=r-${_pkgname,,}
pkgver=2.10.0
pkgrel=1
pkgdesc='Using self-organizing maps for visualization and interpretation of cytometry data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-colorramps
  r-consensusclusterplus
  r-dplyr
  r-flowcore
  r-ggforce
  r-ggnewscale
  r-ggplot2
  r-ggpubr
  r-igraph
  r-magrittr
  r-rlang
  r-rtsne
  r-tidyr
  r-xml
)
optdepends=(
  r-biocstyle
  r-cytoml
  r-flowworkspace
  r-ggpointdensity
  r-ggrepel
  r-pheatmap
  r-scattermore
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('74d4f46e6b3928affca83628d030f9b5cd8624993b7d9723be5dbb49d6f81d9c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
