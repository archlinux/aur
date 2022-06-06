# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=plotgardener
_pkgver=1.2.3
pkgname=r-${_pkgname,,}
pkgver=1.2.3
pkgrel=1
pkgdesc='Coordinate-Based Genomic Visualization Package for R'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-curl
  r-data.table
  r-dplyr
  r-ggplotify
  r-plyranges
  r-purrr
  r-rcolorbrewer
  r-rcpp
  r-rlang
  r-strawr
)
optdepends=(
  r-annotationdbi
  r-annotationhub
  r-bsgenome
  r-bsgenome.hsapiens.ucsc.hg19
  r-complexheatmap
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-interactionset
  r-iranges
  r-knitr
  r-org.hs.eg.db
  r-plotgardenerdata
  r-png
  r-rmarkdown
  r-rtracklayer
  r-scales
  r-showtext
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('06ee0e26b5870f85cebeaaa13a71e753ee4c703c014622f601a11ac7c1df5418')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
