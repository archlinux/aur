# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bbotk
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=1.4.0
pkgrel=1
pkgdesc='Black-Box Optimization Toolkit'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('LGPL')
depends=(
  r
  r-checkmate
  r-data.table
  r-lgr
  r-mlr3misc
  r-paradox
  r-r6
)
optdepends=(
  r-adagio
  r-emoa
  r-gensa
  r-irace
  r-knitr
  r-nloptr
  r-progressr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('4c5d115a3e2534608f1bf2b947169f190f8713244feae93c0d725ee6cf158d31')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
