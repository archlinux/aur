# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rasterVis
_pkgver=0.51.2
pkgname=r-${_pkgname,,}
pkgver=0.51.2
pkgrel=4
pkgdesc='Visualization Methods for Raster Data'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-hexbin
  r-latticeextra
  r-raster
  r-rcolorbrewer
  r-sp
  r-terra
  r-viridislite
  r-zoo
)
optdepends=(
  r-colorspace
  r-dichromat
  r-ggplot2
  r-rgl
  r-sf
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c116f979ed891ec55f3e1e7b9a92436b5ec9430c1170439a501ecb7e2a33ef4d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
