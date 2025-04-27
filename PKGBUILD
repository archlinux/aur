# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=yarn
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=1.34.0
pkgrel=1
pkgdesc='YARN: Robust Multi-Condition RNA-Seq Preprocessing and Normalization'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biobase
  r-biomart
  r-downloader
  r-edger
  r-gplots
  r-limma
  r-matrixstats
  r-preprocesscore
  r-quantro
  r-rcolorbrewer
  r-readr
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5f87ebc7ea208c6cde860d4e9a4add4b2bf263599c185dc69cc1a4f0bd95e3a8')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
