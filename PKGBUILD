# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=projectR
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Functions for the projection of weights from PCA, CoGAPS, NMF, correlation, and clustering"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-cowplot
  r-dplyr
  r-fgsea
  r-ggalluvial
  r-ggplot2
  r-ggrepel
  r-limma
  r-matrixmodels
  r-msigdbr
  r-nmf
  r-rcolorbrewer
  r-reshape2
  r-rocr
  r-scales
  r-tsne
  r-umap
  r-viridis
  r-singlecellexperiment
)
optdepends=(
  r-biocstyle
  r-cogaps
  r-complexheatmap
  r-devtools
  r-gplots
  r-gridextra
  r-knitr
  r-rmarkdown
  r-rmarkdown
  r-seuratobject
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7b2b1d195e85eb9905314b0aa1e5623e')
b2sums=('8cbb2ff4b0302ed99859a882bca769924118ab44ed7d218b307726ca4262cd23665dd20a9edca043245afcfd4c7d12b32a2a932a840ef5234c4f8b0bab258315')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
