# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BMA
_pkgver=3.18.21
pkgname=r-${_pkgname,,}
pkgver=3.18.21
pkgrel=1
pkgdesc='Bayesian Model Averaging'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-inline
  r-leaps
  r-robustbase
  r-rrcov
)
optdepends=(
  r-mass
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d50b1b0c8f2595911cc3745e0f5ceff1faa5592d6df4543f075dba5a34684e60')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
