# system requirements: GNU make
# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=ECOSolveR
_pkgver=0.5.4
pkgname=r-${_pkgname,,}
pkgver=0.5.4
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
sha256sums=('5d7489e8176c1df3f3f1290732243429280efca4f837916e6b6faa6dc8a8e324')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
