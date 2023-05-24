# system requirements: GEOS (>= 3.2.0); for building from source: GEOSfrom https://libgeos.org; GEOS OSX frameworks built by WilliamKyngesburye at http://www.kyngchaos.com/ may be used for sourceinstalls on OSX.
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Robert Greener <me@r0bert.dev>
# Contributor: getzze <getzze@gmail.com>

_pkgname=rgeos
_pkgver=0.6-3
pkgname=r-${_pkgname,,}
pkgver=0.6.3
pkgrel=1
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
sha256sums=('1ebc5a99fdcf7d293811ce26379ba1525a2b9f23b11f1fb4a9c582bf27fc2b3c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
