# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SPONGE
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
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
source=("https://bioconductor.org/packages/3.17/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('4ec8bdffb258be839e469d1baa50c4e9')
b2sums=('706ad7cd66b21bf22ba2d75d7e6c7cddbdfbdb7847ac46b45ececf10a8d1900ced409e3a487ae4f672095c30629f76529e69b2e5c83fdf38bee59dba1d7ae81a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
