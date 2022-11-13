# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat
_pkgver=3.0-2
pkgname=r-${_pkgname,,}
pkgver=3.0.2
pkgrel=1
pkgdesc='Spatial Point Pattern Analysis, Model-Fitting, Simulation, Tests'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-spatstat.core
  r-spatstat.data
  r-spatstat.geom
  r-spatstat.linnet
  r-spatstat.utils
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a02bc010866b712ce1076c95729bdc6ef0f5b06dcb5cc60eccc402af61d118cd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
