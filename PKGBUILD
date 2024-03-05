# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EcoIndR
_pkgver=2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='Ecological Indicators'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-2.0-or-later')
depends=(
  r
  r-fd
  r-picante
  r-rarity
  r-splancs
  r-vegan
)
optdepends=(
  r-alphahull
  r-geor
  r-methods
  r-mgcv
  r-plotrix
  r-raster
  r-sf
  r-shape
  r-sp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
