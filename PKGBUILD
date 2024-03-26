# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat
_pkgver=3.0-8
pkgname=r-${_pkgname,,}
pkgver=3.0.8
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
sha256sums=('c2042e7b68297a479338b765ca4ae70bed2730351f8e79a1697d1d1b4c90103e')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
