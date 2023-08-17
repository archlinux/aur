# system requirements: proj 4.4.6 or higher (http://proj.maptools.org/)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proj4
_pkgver=1.0-13
pkgname=r-${_pkgname,,}
pkgver=1.0.13
pkgrel=1
pkgdesc='A simple interface to the PROJ.4 cartographic projections library'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  proj
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ac5440cb8f29fa5cc0ee0cf540fe3d6fe813dd6f115c996d25c14454fa0977f3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
