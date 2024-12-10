# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=np
_pkgver=0.60-18
pkgname=r-${_pkgname,,}
pkgver=0.60.18
pkgrel=1
pkgdesc='Nonparametric Kernel Smoothing Methods for Mixed Data Types'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-cubature
  r-quadprog
  r-quantreg
)
optdepends=(
  r-ks
  r-logspline
  r-mass
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b21c54c1ac2cb2105087b8af012e0444b2a53b47965f42e776c094b85a7c2a9b')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
