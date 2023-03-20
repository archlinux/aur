# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.random
_pkgver=3.1-4
pkgname=r-${_pkgname,,}
pkgver=3.1.4
pkgrel=3
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
  r-gsl
  r-randomfields
  r-randomfieldsutils
  r-spatial
  r-spatstat
  r-spatstat.explore
  r-spatstat.linnet
  r-spatstat.model
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a6cd75e187a992fd8dae535f6745e12801635a344ca51bd2fe048debea3df7d3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
