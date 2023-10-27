# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FastqCleaner
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='A Shiny Application for Quality Control, Filtering and Trimming of FASTQ Files'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biostrings
  r-dt
  r-htmltools
  r-iranges
  r-rcpp
  r-s4vectors
  r-shiny
  r-shinybs
  r-shortread
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('84fe332d6b8a0687a2df0845d8e804ba0bf364b60b878e48e33fa472c016c76c')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
