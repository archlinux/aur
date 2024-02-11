# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HH
_pkgver=3.1-52
pkgname=r-${_pkgname,,}
pkgver=3.1.52
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
sha256sums=('d5495e18df65de613d9bdc43729ca2ac27746b15b90c06502b2ee5e2458d0383')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
