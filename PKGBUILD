# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=osqp
_pkgver=0.6.0.8
pkgname=r-${_pkgname,,}
pkgver=0.6.0.8
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
sha256sums=('14034045ae4ae5ec4eae4944653d41d94282fa85a0cd53614ac86f34fd02ed97')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
