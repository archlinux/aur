# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=limSolve
_pkgver=1.5.7.1
pkgname=r-${_pkgname,,}
pkgver=1.5.7.1
pkgrel=1
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
sha256sums=('a5945217bbf512724297883f8d7c65846a11202266b2b6bb3355372935e85b92')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
