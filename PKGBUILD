# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cobs
_pkgver=1.3-9
pkgname=r-${_pkgname,,}
pkgver=1.3.9
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
sha256sums=('2fdb34452b8fc39a49e6303f7f1e7ef7fcafceb849e6be05b5bf2a8c1ab7f9b3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
