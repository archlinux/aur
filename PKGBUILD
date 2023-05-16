# system requirements: GNU make
# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=ECOSolveR
_pkgver=0.5.5
pkgname=r-${_pkgname,,}
pkgver=0.5.5
pkgrel=1
pkgdesc='Embedded Conic Solver in R'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
makedepends=('make')
depends=(
  r
)
optdepends=(
  r-covr
  r-knitr
  r-matrix
  r-rmarkdown
  r-slam
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2594ed1602b2fe159cc9aff3475e9cba7c1927b496c3daeabc1c0d227943ecc7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
