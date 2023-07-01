# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MCMCglmm
_pkgver=2.35
pkgname=r-${_pkgname,,}
pkgver=2.35
pkgrel=1
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
  r-bayesm
  r-combinat
  r-mcmcpack
  r-msm
  r-mvtnorm
  r-orthopolynom
  r-rgl
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cc10f074a78702bfe46e342235eff747cd52993ade76f59cf8fa9e80968179a6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
