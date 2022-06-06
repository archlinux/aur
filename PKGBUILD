# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SpatialExtremes
_pkgver=2.1-0
pkgname=r-${_pkgname,,}
pkgver=2.1.0
pkgrel=5
pkgdesc='Modelling Spatial Extremes'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-fields
  r-maps
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('438694a02f4354ccd740675936cb409d9fd634e95d66357583e87b1d6ee73a7c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
