# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=fUnitRoots
_pkgver=4052.82
pkgname=r-${_pkgname,,}
pkgver=4052.82
pkgrel=1
pkgdesc='Rmetrics - Modelling Trends and Unit Roots'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-fbasics
  r-timeseries
  r-urca
)
optdepends=(
  r-runit
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('3396605942327d5410e35fcb98aeeed01ea2d8f0dbf61bc5bf16f68547e77335')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
