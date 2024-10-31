# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=projectR
_pkgver=1.22.0
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
md5sums=('31626fd24bbeeaaf849ed5487f363a39')
b2sums=('7df15f28ef490b51570cf8ec2ebdbecd015cc9024827b7ca89cff0d546658e3c832fb6e4c2b39d393f6c1f7ed37a29a8b11532f08189e52fd8c43e52146fac91')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
