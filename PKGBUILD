# system requirements: netcdf library version 4.1 or later
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ncdf4
_pkgver=1.21
pkgname=r-${_pkgname,,}
pkgver=1.21
pkgrel=1
pkgdesc='Interface to Unidata netCDF (Version 4 or Earlier) Format Data Files'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  netcdf
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2f5ae7def382c595c66b6ed0ea0529f8337108eb73de39939f9762f3fb21b30d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
