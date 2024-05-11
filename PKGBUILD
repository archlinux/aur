# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=glmSparseNet
_pkgver=1.22.0
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
md5sums=('e36eea2e7603e3ae720b683d36e9c54a')
b2sums=('5270ddcdf22fbec1cc179114369622268d1965624818fc47f4e9535d4360e85950136f65535227b6cef26b8736a0f1fe74f19a8106fcd7e7a25db4c39cd62cff')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
