# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=glmSparseNet
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
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
sha256sums=('79e89ecf26082150d4b4e9f556d9c5fd854ffb5b62471da8e3593fbb0eb86c2a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
