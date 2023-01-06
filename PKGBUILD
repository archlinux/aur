# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=drtmle
_pkgver=1.1.2
pkgname=r-${_pkgname,,}
pkgver=1.1.2
pkgrel=1
pkgdesc='Doubly-Robust Nonparametric Estimation and Inference'
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('MIT')
depends=(
  r
  r-future.apply
  r-np
  r-superlearner
)
optdepends=(
  r-foreach
  r-gam
  r-knitr
  r-nloptr
  r-parallel
  r-quadprog
  r-rmarkdown
  r-stringi
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a0af95c961f8e448cb7e983c145a64c513ffc390ceec60fa33469d78f7ef6d63')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
