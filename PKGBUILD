# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.random
_pkgver=3.0-1
pkgname=r-${_pkgname,,}
pkgver=3.0.1
pkgrel=1
pkgdesc="Random Generation Functionality for the 'spatstat' Family"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-spatstat.data
  r-spatstat.geom
  r-spatstat.utils
)
optdepends=(
  r-randomfields
  r-randomfieldsutils
  r-spatial
  r-spatstat
  r-spatstat.core
  r-spatstat.linnet
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('938c845c063b8781bf894c0a67537e7b2a7c425a4beba4a95ec9d2c37b43e5b6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
