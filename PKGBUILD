# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MSnID
_pkgver=1.38.0
pkgname=r-${_pkgname,,}
pkgver=1.38.0
pkgrel=1
pkgdesc='Utilities for Exploration and Assessment of Confidence of LC-MSn Proteomics Identifications'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-annotationhub
  r-biobase
  r-biocgenerics
  r-biocstyle
  r-biostrings
  r-data.table
  r-doparallel
  r-dplyr
  r-foreach
  r-ggplot2
  r-iterators
  r-msmstests
  r-msnbase
  r-mzid
  r-mzr
  r-protgenerics
  r-purrr
  r-r.cache
  r-rcpp
  r-reshape2
  r-rlang
  r-runit
  r-stringr
  r-tibble
  r-xtable
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('846084397bec0b37cdc7c796e9d7c6544b062d119167c65d43b07cd249cd3a56')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
