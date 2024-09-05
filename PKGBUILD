# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gstat
_pkgver=2.1-2
pkgname=r-${_pkgname,,}
pkgver=2.1.2
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
sha256sums=('26d3ebe7e1401eb1ad611b227ac8506ba834187a8979d8a0dccdef77a9a46eff')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
