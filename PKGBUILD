# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FME
_pkgver=1.3.6.3
pkgname=r-${_pkgname,,}
pkgver=1.3.6.3
pkgrel=1
pkgdesc='A Flexible Modelling Environment for Inverse Modelling, Sensitivity, Identifiability and Monte Carlo Analysis'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-coda
  r-desolve
  r-minpack.lm
  r-minqa
  r-rootsolve
)
optdepends=(
  r-diagram
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('83c4c28ad4f9197610be40fb66f1025f438a46e4085d64b736e83a0ab71e36a1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
