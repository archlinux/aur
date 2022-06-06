# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=knn.covertree
_pkgver=1.0
pkgname=r-${_pkgname,,}
pkgver=1.0
pkgrel=4
pkgdesc='An Accurate kNN Implementation with Multiple Distance Measures'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('AGPL')
depends=(
  r
  r-rcpp
  r-rcppeigen
  gcc
)
optdepends=(
  r-fnn
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('7fbfd7f2a6366392c7368fd282eba16b5ab0546f603559eac147f3e679654e57')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
