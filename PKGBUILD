# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=limSolve
_pkgver=1.5.6
pkgname=r-${_pkgname,,}
pkgver=1.5.6
pkgrel=4
pkgdesc='Solving Linear Inverse Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-lpsolve
  r-quadprog
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b97ea9930383634c8112cdbc42f71c4e93fe0e7bfaa8f401921835cb44cb49a0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
