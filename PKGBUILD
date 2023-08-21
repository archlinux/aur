# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MatrixExtra
_pkgver=0.1.14
pkgname=r-${_pkgname,,}
pkgver=0.1.14
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
sha256sums=('01e4de13ca263446f28c5b8ce2e17693783e395329eae46d310a2f7d0c718625')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
