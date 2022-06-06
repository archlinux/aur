# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.linnet
_pkgver=2.3-2
pkgname=r-${_pkgname,,}
pkgver=2.3.2
pkgrel=3
pkgdesc="Linear Networks Functionality of the 'spatstat' Family"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-spatstat.core
  r-spatstat.data
  r-spatstat.geom
  r-spatstat.sparse
  r-spatstat.utils
)
optdepends=(
  r-goftest
  r-locfit
  r-spatstat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9c78a4b680debfff0f3ae934575c30d03ded49bc9a7179475384af0ebaf13778')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
