# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RcppHNSW
_pkgver=0.3.0
pkgname=r-${_pkgname,,}
pkgver=0.3.0
pkgrel=4
pkgdesc="'Rcpp' Bindings for 'hnswlib', a Library for Approximate Nearest Neighbors"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-rcpp
)
optdepends=(
  r-covr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('a0eb4eea65e28ba31e8306a1856f7e617a192bd448b148f88abe99181cbde007')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
