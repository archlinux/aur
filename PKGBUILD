# system requirements: Gnu Scientific Library version >= 1.14
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ridge
_pkgver=3.3
pkgname=r-${_pkgname,,}
pkgver=3.3
pkgrel=1
pkgdesc='Ridge Regression with Automatic Selection of the Penalty Parameter'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  gsl
)
optdepends=(
  r-covr
  r-datasets
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5c2daecf6f97aa099ef5fa54f8448518c4f2ed6e44dd29fc60621a70721c60f5')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
