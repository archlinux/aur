# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=osqp
_pkgver=0.6.0.7
pkgname=r-${_pkgname,,}
pkgver=0.6.0.7
pkgrel=1
pkgdesc="Quadratic Programming Solver using the 'OSQP' Library"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('Apache')
depends=(
  r
  r-r6
  r-rcpp
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ee6584d02341e3f1d8fab3b2cb93defd6c48d561297d82a6bedb3e7541868203')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
