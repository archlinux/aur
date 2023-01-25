# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.random
_pkgver=3.1-3
pkgname=r-${_pkgname,,}
pkgver=3.1.3
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
  r-spatstat.explore
  r-spatstat.linnet
  r-spatstat.model
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b28af559ca28002abf9c937b68ad5e7f7317d8c3f976e9a97bebe0c652c441d0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
