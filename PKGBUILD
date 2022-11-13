# system requirements: C++11, LibTorch (https://pytorch.org/); Only x86_64platforms are currently supported except for ARM system runningmacOS.
# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=torch
_pkgver=0.9.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="Tensors and Neural Networks with 'GPU' Acceleration"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-bit64
  r-callr
  r-cli
  r-coro
  r-ellipsis
  r-magrittr
  r-r6
  r-rcpp
  r-rlang
  r-withr
)
optdepends=(
  r-covr
  r-glue
  r-katex
  r-knitr
  r-mvtnorm
  r-numderiv
  r-palmerpenguins
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('2e68f9b4d2d4f37121ce2a9a0fc29372dbf1261150c467e1c100440dc1b7d4c7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
