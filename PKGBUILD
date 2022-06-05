# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cobs
_pkgver=1.3-5
pkgname=r-${_pkgname,,}
pkgver=1.3.5
pkgrel=1
pkgdesc='Constrained B-Splines (Sparse Matrix Based)'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-quantreg
  r-sparsem
)
optdepends=(
  r-matrix
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7fae7da8f940975d544120c836e2d3b874f9b0cbab9631851ce986709f51c611')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
