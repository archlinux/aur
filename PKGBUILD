# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.sparse
_pkgver=3.0-0
pkgname=r-${_pkgname,,}
pkgver=3.0.0
pkgrel=1
pkgdesc='Sparse Three-Dimensional Arrays and Linear Algebra Utilities'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-abind
  r-spatstat.utils
  r-tensor
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('99be0a3c7592760fdf1668dc0811f75ed91c400390d1ecc3d5e643255f501ad2')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
