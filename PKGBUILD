# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PhosR
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='A set of methods and tools for comprehensive analysis of phosphoproteomics data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-circlize
  r-dendextend
  r-dplyr
  r-e1071
  r-ggally
  r-ggdendro
  r-ggplot2
  r-ggpubr
  r-ggtext
  r-igraph
  r-limma
  r-network
  r-pcamethods
  r-pheatmap
  r-preprocesscore
  r-rcolorbrewer
  r-reshape2
  r-rlang
  r-ruv
  r-s4vectors
  r-summarizedexperiment
  r-tidyr
)
optdepends=(
  r-annotate
  r-biocstyle
  r-calibrate
  r-cluer
  r-directpa
  r-knitr
  r-org.mm.eg.db
  r-org.rn.eg.db
  r-reactome.db
  r-rgl
  r-rmarkdown
  r-sna
  r-stringr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e24af46b24fd6144d042e94b1e09696f91e3d538bbb32a43540b968a0ac9f865')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
