# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SPONGE
_pkgver=1.26.1
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
md5sums=('fe6976386739e0c851946d13300fa033')
b2sums=('aef9652f45a727466be616819cdb0cf96d8bd7f6c085ffc622c1b9aa24b09e2f2fe79ea018efc46eb1d367e047b98375fc71259b99ac0324a709cf595be38a17')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
