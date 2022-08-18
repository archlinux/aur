# system requirements: gfortran (>= 4.6.3)
# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=BayesFM
_pkgver=0.1.5
pkgname=r-${_pkgname,,}
pkgver=0.1.5
pkgrel=2
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
sha256sums=('11a9d20f0e4f1a66839f69fc865842df4dd17bde62646f7cae6680ec8a54d7f4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
