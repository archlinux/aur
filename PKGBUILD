# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sparseMatrixStats
_pkgver=1.12.1
pkgname=r-${_pkgname,,}
pkgver=1.12.1
pkgrel=1
pkgdesc='Summary Statistics for Rows and Columns of Sparse Matrices'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-matrixgenerics
  r-matrixstats
  r-rcpp
)
optdepends=(
  r-bench
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('60e6b36774598e9ea70c9f11f759f1dc3099aa3bce947b54f67f9467d076c47f')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
