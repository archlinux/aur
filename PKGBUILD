# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pipeComp
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=1.14.0
pkgrel=1
pkgdesc='pipeComp pipeline benchmarking framework'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-aricode
  r-biocparallel
  r-circlize
  r-clue
  r-complexheatmap
  r-cowplot
  r-dplyr
  r-ggplot2
  r-intrinsicdimension
  r-knitr
  r-matrixstats
  r-randomcolor
  r-rcolorbrewer
  r-reshape2
  r-rtsne
  r-s4vectors
  r-scales
  r-scater
  r-scran
  r-seurat
  r-singlecellexperiment
  r-summarizedexperiment
  r-uwot
  r-viridislite
)
optdepends=(
  r-biocstyle
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b65c23d21c9176ffe34eda1ead51e9edfffa446d029dad0c16af37585c5907f3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
