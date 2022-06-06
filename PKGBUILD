# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rsparse
_pkgver=0.5.0
pkgname=r-${_pkgname,,}
pkgver=0.5.0
pkgrel=4
pkgdesc='Statistical Learning on Sparse Matrices'
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL')
depends=(
  r
  r-data.table
  r-float
  r-lgr
  r-matrixextra
  r-rcpp
  r-rcpparmadillo
  r-rhpcblasctl
)
optdepends=(
  r-covr
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f8f2c8cc5e9273cda1c32d41683e4948fe26f6e72cedb9babff127210f810534')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
