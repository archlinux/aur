# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ParamHelpers
_pkgver=1.14.1
pkgname=r-${_pkgname,,}
pkgver=1.14.1
pkgrel=4
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
sha256sums=('0450ff8489b0d4d0842130f6a9713ede97da936d7909c43d43587bf2d5a01a21')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
