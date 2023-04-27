# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=glmSparseNet
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Network Centrality Metrics for Elastic-Net Regularized Models'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biomart
  r-digest
  r-dplyr
  r-forcats
  r-futile.logger
  r-futile.options
  r-ggplot2
  r-glmnet
  r-glue
  r-httr
  r-multiassayexperiment
  r-readr
  r-reshape2
  r-stringr
  r-summarizedexperiment
  r-survminer
)
optdepends=(
  r-biocstyle
  r-curatedtcgadata
  r-knitr
  r-proc
  r-rmarkdown
  r-survcomp
  r-survival
  r-tcgautils
  r-testthat
  r-venndiagram
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('28568c4966cea711acdcaa1cae32c9f90bdb714f1f351f04c4e01c69cfe011ee')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
