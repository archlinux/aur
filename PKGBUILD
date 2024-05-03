# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=methrix
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='Fast and efficient summarization of generic bedGraph files from Bisufite sequencing'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-bsgenome
  r-data.table
  r-delayedarray
  r-delayedmatrixstats
  r-genomicranges
  r-ggplot2
  r-hdf5array
  r-iranges
  r-matrixstats
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
)
optdepends=(
  r-biostrings
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.mmusculus.ucsc.mm9
  r-bsseq
  r-dss
  r-genomeinfodb
  r-genomicscores
  r-knitr
  r-mafdb.1kgenomes.phase3.grch38
  r-mafdb.1kgenomes.phase3.hs37d5
  r-plotly
  r-rcolorbrewer
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('116added2fa0d0dceec053598cbc06ec35d336db3bf508cc6c677baed5f0e624')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
