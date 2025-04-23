# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=isomiRs
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Analyze isomiRs and miRNAs from small RNA-seq"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('MIT')
depends=(
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-broom
  r-cowplot
  r-degreport
  r-deseq2
  r-dplyr
  r-genomicranges
  r-ggally
  r-ggplot2
  r-gplots
  r-gridextra
  r-gtools
  r-iranges
  r-limma
  r-rcolorbrewer
  r-readr
  r-reshape
  r-rlang
  r-s4vectors
  r-stringr
  r-summarizedexperiment
  r-tibble
  r-tidyr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-org.mm.eg.db
  r-pheatmap
  r-rmarkdown
  r-targetscan.hs.eg.db
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('29e781df9179cc8b089c44f9726a2681')
b2sums=('3a36ab6947f48346e9bc0000abe6e44e56c92530ae74f27c1eac22262acc81d8cace685815ad358e06f52a5baca569c66f6427633e1402c7b0045e55e0f91beb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  ln -s "/usr/lib/R/library/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
