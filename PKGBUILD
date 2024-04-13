# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SPONGE
_pkgver=1.24.0
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
  r-mirbaseconverter
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
md5sums=('627eb768a9021200f9bafc4e6402c58f')
b2sums=('66a147d616fb2297a706848690759f2cf058875c5bf60d2edcdcf303bcb9bbb20d27284f446d0c6dd506b4bba9a1b8bc7cc057677e3595fbc549ceedc7dd7f87')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
