# system requirements: GNU Make
# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=scs
_pkgver=3.2.4
pkgname=r-${_pkgname,,}
pkgver=3.2.4
pkgrel=1
pkgdesc='Splitting Conic Solver'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
makedepends=('make')
depends=(
  r
)
optdepends=(
  r-matrix
  r-slam
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c3f39874bf4532fa8c2f2e2c41533ba4fe20b61cf6dfc6314407dc981621298f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
