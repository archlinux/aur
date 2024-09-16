# system requirements: GNU make
# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=blavaan
_pkgver=0.5-6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='Bayesian Latent Variable Analysis'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bayesplot
  r-bh
  r-coda
  r-future.apply
  r-lavaan
  r-loo
  r-mnormt
  r-nonnest2
  r-rcpp
  r-rcppeigen
  r-rcppparallel
  r-rstan
  r-rstantools
  r-stanheaders
  r-tmvnsim
)
optdepends=(
  r-cmdstanr
  r-modeest
  r-rjags
  r-runjags
  r-semtools
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('1e1f3c9debdc14b39a9ae98ef4269457cac19b9015aa6f7b0196a865d4d37b51')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
