# system requirements: GNU make
# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=OpenMx
_pkgver=2.21.10
pkgname=r-${_pkgname,,}
pkgver=2.21.10
pkgrel=1
pkgdesc='Extended Structural Equation Modelling'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Apache')
depends=(
  r
  r-bh
  r-digest
  r-lifecycle
  r-rcpp
  r-rcppeigen
  r-rcppparallel
  r-rpf
  r-stanheaders
)
optdepends=(
  r-covr
  r-ggplot2
  r-ifatools
  r-knitr
  r-lme4
  r-markdown
  r-mvtnorm
  r-numderiv
  r-reshape2
  r-rmarkdown
  r-roxygen2
  r-rpf
  r-snowfall
  r-testthat
  r-umx
)
makedepends=(
  gcc-fortran
  make
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d513227ca7a60faf1b16e9be64864401914482aac9a326676fe1d052632c94ce')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
