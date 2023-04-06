# system requirements: GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=glmmTMB
_pkgver=1.1.7
pkgname=r-${_pkgname,,}
pkgver=1.1.7
pkgrel=1
pkgdesc='Generalized Linear Mixed Models using Template Model Builder'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('AGPL')
depends=(
  r
  r-lme4
  r-numderiv
  r-rcppeigen
  r-tmb
  make
)
optdepends=(
  r-bbmle
  r-boot
  r-broom
  r-broom.mixed
  r-car
  r-coda
  r-dharma
  r-dotwhisker
  r-effects
  r-emmeans
  r-estimability
  r-ggplot2
  r-huxtable
  r-knitr
  r-lattice
  r-mass
  r-mlmrev
  r-multcomp
  r-mumin
  r-mvabund
  r-parallel
  r-plyr
  r-png
  r-pscl
  r-reshape2
  r-rmarkdown
  r-testthat
  r-texreg
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a38be6e3b8a65a928d19970aee2b13d28535e42b97a046b2f00014f78475c1f1')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
