# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat
_pkgver=3.0-3
pkgname=r-${_pkgname,,}
pkgver=3.0.3
pkgrel=1
pkgdesc='Spatial Point Pattern Analysis, Model-Fitting, Simulation, Tests'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-spatstat.data
  r-spatstat.explore
  r-spatstat.geom
  r-spatstat.linnet
  r-spatstat.model
  r-spatstat.random
  r-spatstat.utils
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1daf773656da834790ea4a9013d1e1858575888e55007a3a5849b7290771502a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
