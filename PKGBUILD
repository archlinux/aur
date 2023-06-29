# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=polspline
_pkgver=1.1.23
pkgname=r-${_pkgname,,}
pkgver=1.1.23
pkgrel=1
pkgdesc='Polynomial Spline Routines'
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
sha256sums=('8363bddf702542783c7c48a12f5fd5bcf3c003ebff88ad5c31f1fb04f49149e1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
