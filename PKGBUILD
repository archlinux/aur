# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SPONGE
_pkgver=1.34.1
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
  r-logger
  r-metbrewer
  r-ppcor
  r-randomforest
  r-rlang
  r-stringr
  r-tibble
  r-tidyr
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
md5sums=('d360aa0e876bb6e3e403ca3e02a6aa27')
b2sums=('ade6798383bf16048481e3336a340a3e60f69cf275e2d171d36b545669fe38846f0bf0c8d972d6e9f7da52f08195f0bec663809fef31cfb8466218a61979bca5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
