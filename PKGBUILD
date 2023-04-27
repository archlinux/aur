# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CellBarcode
_pkgver=1.6.0
pkgname=r-${_pkgname,,}
pkgver=1.6.0
pkgrel=1
pkgdesc='Cellular DNA Barcode Analysis toolkit'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-bh
  r-biostrings
  r-ckmeans.1d.dp
  r-data.table
  r-egg
  r-ggplot2
  r-magrittr
  r-plyr
  r-rcpp
  r-s4vectors
  r-seqinr
  r-shortread
  r-stringr
  r-zlibbioc
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ced1963d99c0e703e8f31affba515c97cf16e69ee4cb93eb1e6842fd961fd769')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
