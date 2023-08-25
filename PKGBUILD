# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mapplots
_pkgver=1.5.2
pkgname=r-${_pkgname,,}
pkgver=1.5.2
pkgrel=1
pkgdesc='Data Visualisation on Maps'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
)
optdepends=(
  r-shapefiles
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ed0e151d6865549d1a10882984a7fb29bc89a7b94ad69e512f90937b981c8a18')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
