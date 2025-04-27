# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=glmSparseNet
_pkgver=1.26.0
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
md5sums=('e73e257b4d3594cc82e9798b2372098c')
b2sums=('f69fae0a7914077428ccd1991d89468b214fd757551f03206cb83b55f14c07a7980454e89ab68372ce07f78b65f3ffd9aa5cdd378173b12cd03e31339a3ee883')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
