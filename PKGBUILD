# system requirements: proj 4.4.6 or higher (http://proj.maptools.org/)
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=proj4
_pkgver=1.0-11
pkgname=r-${_pkgname,,}
pkgver=1.0.11
pkgrel=4
pkgdesc='A simple interface to the PROJ.4 cartographic projections library'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  proj
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c5f186530267005d53cc2e86849613b254ca4515a8b10310146f712d45a1d11d')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
