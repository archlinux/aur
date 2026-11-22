# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mlr3misc
_pkgver=0.24.0
pkgname=r-${_pkgname,,}
pkgver=0.24.0
pkgrel=1
pkgdesc="Helper Functions for 'mlr3'"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-backports
  r-checkmate
  r-data.table
  r-digest
  r-r6
  r-cli
)
optdepends=(
  r-callr
  r-evaluate
  r-paradox
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('09481b590a86aeae64ebe81fa460499ccbc6a1f0753135192edefdc6d964da60')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
