# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chromVAR
_pkgver=1.26.0
pkgname=r-${_pkgname,,}
pkgver=1.26.0
pkgrel=1
pkgdesc='Chromatin Variation Across Regions'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-dt
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-iranges
  r-miniui
  r-nabor
  r-plotly
  r-rcolorbrewer
  r-rcpp
  r-rcpparmadillo
  r-rsamtools
  r-rtsne
  r-s4vectors
  r-shiny
  r-summarizedexperiment
  r-tfbstools
  gcc
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg19
  r-jaspar2016
  r-knitr
  r-motifmatchr
  r-pheatmap
  r-readr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5b0f0601b36d6feb4eb17c9a4909e37c711344c962eb932bcf72e3a5430f5e24')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
