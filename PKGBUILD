# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppAnnoy
_pkgver=0.0.21
pkgname=r-${_pkgname,,}
pkgver=0.0.21
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
sha256sums=('5804a233db847ddf622ef64823f1bfad16e515cd369e5fa781e9d80a4b57f0f7')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
