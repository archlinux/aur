# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FME
_pkgver=1.3.6.2
pkgname=r-${_pkgname,,}
pkgver=1.3.6.2
pkgrel=4
pkgdesc='A Flexible Modelling Environment for Inverse Modelling, Sensitivity, Identifiability and Monte Carlo Analysis'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-coda
  r-desolve
  r-minpack.lm
  r-minqa
  r-rootsolve
)
optdepends=(
  r-diagram
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('65a200f8171e27f0a3d7ffce3e49b01561f219a11f3cb515ff613a45927ff618')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
