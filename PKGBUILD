# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BMA
_pkgver=3.18.20
pkgname=r-${_pkgname,,}
pkgver=3.18.20
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
sha256sums=('2d72a96cbf2cbfa8b38453adc309e9e0596270e923c9c991bb8fb4e909f830a3')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
