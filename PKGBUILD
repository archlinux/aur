# system requirements: C++11, GNU make
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=runibic
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=1.24.0
pkgrel=1
pkgdesc='runibic: row-based biclustering algorithm for analysis of gene expression data in R'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biclust
  r-rcpp
  r-summarizedexperiment
  r-testthat
  make
)
optdepends=(
  r-affy
  r-airway
  r-geoquery
  r-knitr
  r-qubic
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('0db39adb3aebc4a0f26ac8fa38ac04addcadb56ad7b68ab4023ed6374d957766')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
