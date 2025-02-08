# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HH
_pkgver=3.1-53
pkgname=r-${_pkgname,,}
pkgver=3.1.53
pkgrel=1
pkgdesc='Statistical Analysis and Data Display: Heiberger and Holland'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-colorspace
  r-gridextra
  r-hmisc
  r-latticeextra
  r-leaps
  r-multcomp
  r-rcolorbrewer
  r-reshape2
  r-rmpfr
  r-shiny
  r-vcd
)
optdepends=(
  r-car
  r-microplot
  r-mvtnorm
  r-rcmdr
  r-rcmdrplugin.hh
  r-teachingdemos
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b276ade4f46e4e39e01259ebbfe2d578e38271cb3f7b4074d1b1997e6df79892')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
