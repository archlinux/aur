# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=np
_pkgver=0.60-16
pkgname=r-${_pkgname,,}
pkgver=0.60.16
pkgrel=3
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
sha256sums=('bef967c0195059e53c68e64d7540bf4627415c832f050c8806520ab8796e01b0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
