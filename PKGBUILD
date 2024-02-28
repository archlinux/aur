# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.geom
_pkgver=3.2-9
pkgname=r-${_pkgname,,}
pkgver=3.2.9
pkgrel=1
pkgdesc="Geometrical Functionality of the 'spatstat' Family"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-deldir
  r-polyclip
  r-spatstat.data
  r-spatstat.utils
)
optdepends=(
  r-fftwtools
  r-spatial
  r-spatstat
  r-spatstat.explore
  r-spatstat.linnet
  r-spatstat.model
  r-spatstat.random
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a7337166481366ff301c9585636e162d94c8593511a36ae33477966720c9d517')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
