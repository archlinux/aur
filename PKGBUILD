# system requirements: Meme Suite (v5.3.3 or above)<http://meme-suite.org/doc/download.html>
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=memes
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=1.8.0
pkgrel=1
pkgdesc='motif matching, comparison, and de novo discovery using the MEME Suite'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-biostrings
  r-cmdfun
  r-dplyr
  r-genomicranges
  r-ggplot2
  r-ggseqlogo
  r-magrittr
  r-matrixstats
  r-patchwork
  r-processx
  r-purrr
  r-readr
  r-rlang
  r-tibble
  r-tidyr
  r-universalmotif
  r-usethis
  r-xml2
)
optdepends=(
  r-bsgenome.dmelanogaster.ucsc.dm3
  r-bsgenome.dmelanogaster.ucsc.dm6
  r-covr
  r-cowplot
  r-forcats
  r-knitr
  r-motifdb
  r-pheatmap
  r-plyranges
  r-pmcmrplus
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('d90606eae83beddab18ed0164d2bf7cf43677f0ff30d4194eec29ba5258d6bac')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
