# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TFEA.ChIP
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=1.20.0
pkgrel=1
pkgdesc='Analyze Transcription Factor Enrichment'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-biomart
  r-dplyr
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-org.hs.eg.db
  r-r.utils
)
optdepends=(
  r-biocgenerics
  r-deseq2
  r-ggplot2
  r-ggrepel
  r-knitr
  r-plotly
  r-rcompanion
  r-rmarkdown
  r-s4vectors
  r-scales
  r-tidyr
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('9991db1bc94d26ed7d4a2b142d87260bc704bdfb579f1745aff891f626235f06')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
