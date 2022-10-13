# system requirements: GNU Make
# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=scs
_pkgver=3.0-1
pkgname=r-${_pkgname,,}
pkgver=3.0.1
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
  r-slam
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d6881eeec7282f8bfbf60847327786e7f90299e4b8c0b084d8bd11fec7705913')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
