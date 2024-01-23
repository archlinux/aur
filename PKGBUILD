# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MatrixExtra
_pkgver=0.1.15
pkgname=r-${_pkgname,,}
pkgver=0.1.15
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
sha256sums=('e98f410df97923d1156759277b73ce3674ff11120830d6f9546e0e914ad4e056')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
