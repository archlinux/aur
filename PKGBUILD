# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MIMOSA
_pkgver=1.37.0
pkgname=r-${_pkgname,,}
pkgver=1.37.0
pkgrel=1
pkgdesc='Mixture Models for Single-Cell Assays'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biobase
  r-coda
  r-data.table
  r-dplyr
  r-formula
  r-ggplot2
  r-mcmcpack
  r-modeest
  r-plyr
  r-pracma
  r-rcpp
  r-rcpparmadillo
  r-reshape
  r-rlang
  r-scales
  r-testthat
  r-tidyr
)
optdepends=(
  r-knitr
  r-parallel
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('8c537413acfb05e644a3712ebef6fefb08a31f4aa7c83b3f27ab713d4306ff36')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
