# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mlr3measures
_pkgver=0.4.1
pkgname=r-${_pkgname,,}
pkgver=0.4.1
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
sha256sums=('ab32e8feca9b021763d5da2fcd85ab80ee5ca72e11e9ffd32ea627765a1f7ccd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
