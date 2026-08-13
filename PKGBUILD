# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=glmSparseNet
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Network Centrality Metrics for Elastic-Net Regularized Models"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biomart
  r-checkmate
  r-dplyr
  r-forcats
  r-futile.logger
  r-ggplot2
  r-glmnet
  r-glue
  r-httr
  r-lifecycle
  r-multiassayexperiment
  r-readr
  r-rlang
  r-summarizedexperiment
  r-survminer
  r-tcgautils
)
optdepends=(
  r-biocstyle
  r-curatedtcgadata
  r-knitr
  r-magrittr
  r-proc
  r-reshape2
  r-rmarkdown
  r-testthat
  r-venndiagram
  r-withr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('97fe2b842dfb9e322df6161017b4f13f')
b2sums=('fc9ac924ed7640e514933e25d96fc28a5a3aa26c48aba7e0f4c3b691b1788a696a84f46ae0ca0267e1657297a8bee227a0e84ebca2d742e65779fbe9e0a150fd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
