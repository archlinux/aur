# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TileDBArray
_pkgver=1.10.0
pkgname=r-${_pkgname,,}
pkgver=1.10.0
pkgrel=1
pkgdesc='Using TileDB as a DelayedArray Backend'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-delayedarray
  r-rcpp
  r-s4vectors
  r-tiledb
)
optdepends=(
  r-biocparallel
  r-biocstyle
  r-knitr
  r-matrix
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f79eaa7382b54355e158d53a59cc3abfc8f56d7b754402931434a9501b070f96')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
