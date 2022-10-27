# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rmutil
_pkgver=1.1.10
pkgname=r-${_pkgname,,}
pkgver=1.1.10
pkgrel=1
pkgdesc='Utilities for Nonlinear Regression and Repeated Measurements Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('819fd7ce695cc742b4594705986eb06764460fc88521ea32de793c49de7ca5f9')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
