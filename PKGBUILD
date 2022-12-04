# system requirements: netcdf library version 4.1 or later
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ncdf4
_pkgver=1.20
pkgname=r-${_pkgname,,}
pkgver=1.20
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
sha256sums=('78cb4e25a7373953b77fb21eb6db8a6cd111bb043fd9dc9747d286fe7c2ff1ce')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
