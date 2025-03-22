# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=glmSparseNet
_pkgver=1.24.0
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
md5sums=('d853ca6bb133d5c7f64ed46a73712a76')
b2sums=('dc55854a800420fa56ca6b9785726b822dce67c0cf729bd5978f336d1e99d67b0c0a4300ce4d31b13fbeaa12c492e7239c8ffc833aedfc08ce7e16aebe22f09e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
