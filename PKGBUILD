# system requirements: GNU make
# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=RoBTT
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc='Robust Bayesian T-Test'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bayestools
  r-bh
  r-bridgesampling
  r-ggplot2
  r-rcpp
  r-rcppeigen
  r-rcppparallel
  r-rdpack
  r-rstan
  r-rstantools
  r-stanheaders
)
optdepends=(
  r-covr
  r-knitr
  r-parallel
  r-rmarkdown
  r-testthat
  r-vdiffr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('79db72dfdf2e5ba5e942daf575cc657fff46a49f8bac78c097c67dcbcdd7a910')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
