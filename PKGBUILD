# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mutoss
_pkgver=0.1-12
pkgname=r-${_pkgname,,}
pkgver=0.1.12
pkgrel=4
pkgdesc='Unified Multiple Testing Procedures'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-multcomp
  r-multtest
  r-mvtnorm
  r-plotrix
)
optdepends=(
  r-fdrtool
  r-lattice
  r-qvalue
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2889ae3d502157592697124eb86adc14911e2b7fdaa7204743a376b1eeb967fa')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
