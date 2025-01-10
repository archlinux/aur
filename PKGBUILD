# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ParamHelpers
_pkgver=1.14.2
pkgname=r-${_pkgname,,}
pkgver=1.14.2
pkgrel=1
pkgdesc='Helpers for Parameters in Black-Box Optimization, Tuning and Machine Learning'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
  r-backports
  r-bbmisc
  r-checkmate
  r-fastmatch
)
optdepends=(
  r-covr
  r-eaf
  r-emoa
  r-ggally
  r-ggplot2
  r-grid
  r-gridextra
  r-interp
  r-irace
  r-lhs
  r-plyr
  r-reshape2
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ab6859b2d12fc10b09f316ea673b781c5f167eda86b19e423dd6fd4f97462375')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
