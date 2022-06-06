# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=glmSparseNet
_pkgver=1.14.1
pkgname=r-${_pkgname,,}
pkgver=1.14.1
pkgrel=2
pkgdesc='Network Centrality Metrics for Elastic-Net Regularized Models'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biomart
  r-dplyr
  r-forcats
  r-futile.logger
  r-ggplot2
  r-glmnet
  r-glue
  r-httr
  r-loose.rock
  r-multiassayexperiment
  r-readr
  r-reshape2
  r-sparsebn
  r-sparsebnutils
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
sha256sums=('22d3ec6cb982fb1f4501bf17f52edff196215204ea942399b3dabfecf2ebeb76')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
