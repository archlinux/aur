# system requirements: GNU make, pandoc (>= 1.12.3), pandoc-citeproc
# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=rstanarm
_pkgver=2.26.1
pkgname=r-${_pkgname,,}
pkgver=2.26.1
pkgrel=1
pkgdesc='Bayesian Applied Regression Modeling via Stan'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-bayesplot
  r-bh
  r-ggplot2
  r-lme4
  r-loo
  r-rcpp
  r-rcppeigen
  r-rcppparallel
  r-rstan
  r-rstantools
  r-shinystan
  r-stanheaders
  pandoc
)
optdepends=(
  r-betareg
  r-biglm
  r-data.table
  r-digest
  r-gamm4
  r-gridextra
  r-hsaur3
  r-knitr
  r-mass
  r-mgcv
  r-rmarkdown
  r-roxygen2
  r-shiny
  r-stanheaders
  r-testthat
)
makedepends=('make')
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4a54792d6e035931b613647aebfc98b81d1aac646a5a3f6f116b6f560d544444')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
