# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fields
_pkgver=14.0
pkgname=r-${_pkgname,,}
pkgver=14.0
pkgrel=1
pkgdesc='Tools for Spatial Data'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-maps
  r-spam
  r-viridis
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('907de477a275bad073fa972fd33896158bb41d4d7349f3a00bba3851ba174f66')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
