# system requirements: C++11
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NxtIRFcore
_pkgver=1.2.1
pkgname=r-${_pkgname,,}
pkgver=1.2.1
pkgrel=1
pkgdesc='Core Engine for NxtIRF: a User-Friendly Intron Retention and Alternative Splicing Analysis using the IRFinder Engine'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-annotationhub
  r-biocfilecache
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-data.table
  r-delayedarray
  r-delayedmatrixstats
  r-fst
  r-genefilter
  r-genomeinfodb
  r-genomicranges
  r-ggplot2
  r-hdf5array
  r-iranges
  r-magrittr
  r-nxtirfdata
  r-plotly
  r-r.utils
  r-rcpp
  r-rcppprogress
  r-rhdf5
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
  r-zlibbioc
  gcc
)
optdepends=(
  r-crayon
  r-deseq2
  r-doubleexpseq
  r-egg
  r-knitr
  r-limma
  r-openssl
  r-pheatmap
  r-rmarkdown
  r-rsubread
  r-shiny
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9f67c0eacda7af183592934bc5cd4a6db4b8a9fa6fc0870db1bfeac67d024dd6')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
