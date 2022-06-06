# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=polspline
_pkgver=1.1.20
pkgname=r-${_pkgname,,}
pkgver=1.1.20
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
sha256sums=('6992484e9e41036debef1e705e26959f8f5c7a68d3e1fda58273d2a72297a1b5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
