# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppAnnoy
_pkgver=0.0.19
pkgname=r-${_pkgname,,}
pkgver=0.0.19
pkgrel=4
pkgdesc="'Rcpp' Bindings for 'Annoy', a Library for Approximate Nearest Neighbors"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
)
optdepends=(
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('89b209900516f3096b53c90937081fb8965c605c867aa465f1b3b68092b7688a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
