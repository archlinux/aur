# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MCMCglmm
_pkgver=2.36
pkgname=r-${_pkgname,,}
pkgver=2.36
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
sha256sums=('66ffd9aaf8035c7abe7208c8514c60cb56c8c6a170de207d6608f5c44a4f8af1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
