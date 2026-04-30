# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gstat
_pkgver=2.1-6
pkgname=r-${_pkgname,,}
pkgver=2.1.6
pkgrel=1
pkgdesc='Spatial and Spatio-Temporal Geostatistical Modelling, Prediction and Simulation'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-fnn
  r-sf
  r-sftime
  r-sp
  r-spacetime
  r-stars
  r-zoo
)
optdepends=(
  r-fields
  r-future
  r-future.apply
  r-mapdata
  r-maps
  r-raster
  r-xts
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f227c849800fa477f4d5608f9868c3efefc8831b5a80fa51b4122c0cb5b8dd39')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
