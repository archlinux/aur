# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat
_pkgver=2.3-4
pkgname=r-${_pkgname,,}
pkgver=2.3.4
pkgrel=3
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
sha256sums=('4ea0f8d70b926b92bf4a06521f985a0bb6d573619f5d526957c87860ccb999da')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
