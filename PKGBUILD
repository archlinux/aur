# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BMA
_pkgver=3.18.17
pkgname=r-${_pkgname,,}
pkgver=3.18.17
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
sha256sums=('6d8c514fa179f8a48c2105b551a8a08e28ea4375d06150a4b8ab4ccda577daf5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
