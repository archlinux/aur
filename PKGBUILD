# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=projectR
_pkgver=1.20.0
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
md5sums=('7dbc988526df54d7c87f57bcb7dbaa76')
b2sums=('a935579429e123158a655fe406e2a0e2ba9102eb4660ea8ef09ca7916e5f4239ce13a03280f7cb9bc21650a837fdbeda3f7dd35626483d67d88d75a1b66a19c9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
