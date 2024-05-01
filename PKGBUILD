# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dStruct
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Identifying differentially reactive regions from RNA structurome profiling data'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-ggplot2
  r-iranges
  r-purrr
  r-reshape2
  r-rlang
  r-s4vectors
  r-zoo
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
  r-tidyverse
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('07b663e1fea445583010a25ec39305cbc96ba51dc4907f91d04b3ba363f69090')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
