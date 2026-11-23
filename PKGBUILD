# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TFEA.ChIP
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Analyze Transcription Factor Enrichment'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biomart
  r-dplyr
  r-experimenthub
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-r.utils
  r-rlang
)
optdepends=(
  r-annotationdbi
  r-babelgene
  r-biocgenerics
  r-biocstyle
  r-deseq2
  r-edger
  r-ggplot2
  r-ggrepel
  r-knitr
  r-limma
  r-meta
  r-plotly
  r-purrr
  r-rcolorbrewer
  r-rcompanion
  r-rmarkdown
  r-runit
  r-s4vectors
  r-scales
  r-seqinfo
  r-testthat
  r-tibble
  r-tidyr
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.hsapiens.ucsc.hg38.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('36d5e22caa899c06288a6bf56ced5abb9cbc50da9f491db48f525d62f04abae4')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
