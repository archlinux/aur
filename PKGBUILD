# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bootstrap
_pkgver=2019.6
pkgname=r-${_pkgname,,}
pkgver=2019.6
pkgrel=4
pkgdesc='Functions for the Book "An Introduction to the Bootstrap"'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('BSD')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5252fdfeb944cf1fae35016d35f9333b1bd1fc8c6d4a14e33901160e21968694')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
