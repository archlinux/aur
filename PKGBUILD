# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=np
_pkgver=0.60-17
pkgname=r-${_pkgname,,}
pkgver=0.60.17
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
sha256sums=('d97957cb234ec2e570fc2d02d305eadff3d71939484b3d1054ed8b67a3427f36')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
