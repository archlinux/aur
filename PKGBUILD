# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MatrixExtra
_pkgver=0.1.11
pkgname=r-${_pkgname,,}
pkgver=0.1.11
pkgrel=1
pkgdesc='Extra Methods for Sparse Matrices'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-float
  r-rcpp
  r-rhpcblasctl
)
optdepends=(
  r-data.table
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('558d8ede4bced4a4d4c1b886fd7fd00d1a205e7a8baf978509473724285a6234')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
