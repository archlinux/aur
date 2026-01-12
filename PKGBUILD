# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppAnnoy
_pkgver=0.0.23
pkgname=r-${_pkgname,,}
pkgver=0.0.23
pkgrel=1
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
sha256sums=('e502e8d98590a3b9dc7ec82ec7242ab737a653603ecb0fc7145798f3e7e2d1dc')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
