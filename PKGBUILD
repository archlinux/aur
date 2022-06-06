# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MCMCglmm
_pkgver=2.33
pkgname=r-${_pkgname,,}
pkgver=2.33
pkgrel=4
pkgdesc='MCMC Generalised Linear Mixed Models'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-ape
  r-coda
  r-corpcor
  r-cubature
  r-tensora
  gcc
)
optdepends=(
  r-combinat
  r-mvtnorm
  r-orthopolynom
  r-rgl
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('b56d72e799f8ed5fa2a05ecc743e5b8051f9cc2de57ad3e6de2dcb1c1715d4fc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
