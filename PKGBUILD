# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=limSolve
_pkgver=1.5.7
pkgname=r-${_pkgname,,}
pkgver=1.5.7
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
sha256sums=('047766ff01171c67763f50103c4cfa97c37300e01dd84b0b2410e979e39c58f1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
