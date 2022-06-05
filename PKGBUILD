# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=BayesFactor
_pkgver=0.9.12-4.3
pkgname=r-${_pkgname,,}
pkgver=0.9.12.4.3
pkgrel=1
pkgdesc='Computation of Bayes Factors for Common Designs'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-coda
  r-gtools
  r-hypergeo
  r-matrixmodels
  r-mvtnorm
  r-pbapply
  r-rcpp
  r-rcppeigen
  r-stringr
)
optdepends=(
  r-arm
  r-domc
  r-foreach
  r-knitr
  r-languager
  r-lme4
  r-markdown
  r-testthat
  r-xtable
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('dcf9f88f31e7ac0451925528b025674ce38fe0c068868821c115ed42485e309c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
