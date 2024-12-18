# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SPONGE
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Sparse Partial Correlations On Gene Expression"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-biobase
  r-biomart
  r-caret
  r-complexheatmap
  r-cvms
  r-data.table
  r-dorng
  r-dplyr
  r-expm
  r-foreach
  r-ggplot2
  r-ggpubr
  r-ggridges
  r-glmnet
  r-grbase
  r-igraph
  r-iterators
  r-logging
  r-metbrewer
  r-ppcor
  r-randomforest
  r-rlang
  r-stringr
  r-tidyr
  r-tidyverse
  r-tnet
)
optdepends=(
  r-bigmemory
  r-digest
  r-doparallel
  r-ggrepel
  r-gridextra
  r-gsva
  r-knitr
  r-rmarkdown
  r-testthat
  r-visnetwork
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2133e52cd4046b2fa7e40988ac2cdc0c')
b2sums=('f3b93ade9302650f54b642829c4f3e2be5092c8510b00befa8f493fa9a659979efdc4e527f08ab8a426c433a0eb4dee63f0be8bba0528b62c10f937e47321f6f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
