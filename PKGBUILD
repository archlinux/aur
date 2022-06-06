# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=pspline
_pkgver=1.0-19
pkgname=r-${_pkgname,,}
pkgver=1.0.19
pkgrel=3
pkgdesc='Penalized Smoothing Splines'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Unlimited')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ba55bf193f1df9785a0e13b7ef727d5fd2415b318cd6a26b48a2db490c4dfe40')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
