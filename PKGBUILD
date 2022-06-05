# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DelayedDataFrame
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=1.12.0
pkgrel=1
pkgdesc='Delayed operation on DataFrame using standard DataFrame metaphor'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-biocgenerics
  r-delayedarray
  r-s4vectors
)
optdepends=(
  r-gdsarray
  r-knitr
  r-rmarkdown
  r-seqarray
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0d15ccab2b7df15b4c240084609fc23a2a0f9bf4ef3c051b1951d0be012c4ada')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
