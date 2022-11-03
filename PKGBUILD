# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FlowSOM
_pkgver=2.6.0
pkgname=r-${_pkgname,,}
pkgver=2.6.0
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
  r-cytoml
  r-dplyr
  r-flowcore
  r-flowworkspace
  r-ggforce
  r-ggnewscale
  r-ggplot2
  r-ggpointdensity
  r-ggpubr
  r-ggrepel
  r-igraph
  r-magrittr
  r-pheatmap
  r-rcolorbrewer
  r-rlang
  r-rtsne
  r-scattermore
  r-tidyr
  r-xml
)
optdepends=(
  r-biocstyle
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2cfcb3ca83f0c35eceb753b551eb5fc8b5022dfceeeefa017eb11406218dfde8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
