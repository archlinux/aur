# system requirements: gfortran (>= 4.6.3)
# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=BayesFM
_pkgver=0.1.7
pkgname=r-${_pkgname,,}
pkgver=0.1.7
pkgrel=1
pkgdesc='Bayesian Inference for Factor Modeling'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-checkmate
  r-coda
  r-ggplot2
  r-gridextra
  r-plyr
)
makedepends=(gcc-fortran)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('c1b58443bdd03a92ef9731d9e24530700fc5207455a5e24433fac7fe29872ac6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
