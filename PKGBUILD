# system requirements: GEOS (>= 3.2.0); for building from source: GEOSfrom https://libgeos.org; GEOS OSX frameworks built by WilliamKyngesburye at http://www.kyngchaos.com/ may be used for sourceinstalls on OSX.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: getzze <getzze@gmail.com>

_pkgname=rgeos
_pkgver=0.5-9
pkgname=r-${_pkgname,,}
pkgver=0.5.9
pkgrel=6
pkgdesc="Interface to Geometry Engine - Open Source ('GEOS')"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-sp
  geos
)
optdepends=(
  r-maps
  r-maptools
  r-rgdal
  r-testthat
  r-xml
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ab90cbfe6a3680a9d2eed5e655064a075adc66788e304468969ab7cc2df0e3d4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
