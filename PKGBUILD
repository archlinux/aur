# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mlr3measures
_pkgver=0.5.0
pkgname=r-${_pkgname,,}
pkgver=0.5.0
pkgrel=1
pkgdesc="Performance Measures for 'mlr3'"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-checkmate
  r-prroc
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a7a88d96c492e2d8894e5883d69e39238a4b5bf0928a0b0e0abad1617a0f114c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
