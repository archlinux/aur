# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=densEstBayes
_pkgver=1.0-2.1
pkgname=r-${_pkgname,,}
pkgver=1.0.2.1
pkgrel=3
pkgdesc='Density Estimation via Bayesian Inference Engines'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bh
  r-rcpp
  r-rcpparmadillo
  r-rcppeigen
  r-rcppparallel
  r-rstan
  r-stanheaders
  make
  r-rstantools
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4b7066e18902ee2a0ea084513b237b5fb8e43fe3102354c2fb216d5a8c7df5df')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
