# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=adehabitatMA
_pkgver=0.3.16
pkgname=r-${_pkgname,,}
pkgver=0.3.16
pkgrel=1
pkgdesc='Tools to Deal with Raster Maps'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-sp
)
optdepends=(
  r-maptools
  r-mass
  r-tkrplot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('089e415a26b6c45023d04ef64c9cf6d336a233f0b0078fc72adbe601b389b5ca')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
