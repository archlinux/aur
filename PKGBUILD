# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=projectR
_pkgver=1.28.0
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
md5sums=('5e8dfce5b61b5388d1d4a98d4a0bf7e6')
b2sums=('6768e5ad520f06a0414e4aa7268e4f86efdc92abb955fb8f85f19b853903196410a99238a9da61d94ed8b85f93f1b20f6db08a6ee9d7acbbc1e27d41ba56751f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
