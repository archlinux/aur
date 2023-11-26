# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=snowfall
_pkgver=1.84-6.3
pkgname=r-${_pkgname,,}
pkgver=1.84.6.3
pkgrel=1
pkgdesc='Easier cluster computing (based on snow).'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-snow
)
optdepends=(
  r-rmpi
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2641932b01041e34b7afb1261f649755b4c8d6560080e0e2ee549ffdf3b8b143')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
