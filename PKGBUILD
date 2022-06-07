# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sampSurf
_pkgver=0.7-6
pkgname=r-${_pkgname,,}
pkgver=0.7.6
pkgrel=3
pkgdesc='Sampling Surface Simulation for Areal Sampling Methods'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-latticeextra
  r-raster
  r-rastervis
  r-sp
)
optdepends=(
  r-rgeos
  r-rgl
)
source=("https://cran.r-project.org/src/contrib/Archive/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('63deaaed014dac52e855c7b620ade058cc1887eef984a5536c6083dfb36b56b8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
