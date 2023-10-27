# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=projectR
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Functions for the projection of weights from PCA, CoGAPS, NMF, correlation, and clustering'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-cowplot
  r-dplyr
  r-ggalluvial
  r-ggplot2
  r-ggrepel
  r-limma
  r-matrixmodels
  r-nmf
  r-rcolorbrewer
  r-reshape2
  r-rocr
  r-scales
  r-tsne
  r-umap
  r-viridis
)
optdepends=(
  r-biocstyle
  r-cogaps
  r-complexheatmap
  r-devtools
  r-gplots
  r-grid
  r-gridextra
  r-knitr
  r-rmarkdown
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('68062e5d221126a6980162472971aaaf1495a3d2c940927874827504e7b4e8c9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
