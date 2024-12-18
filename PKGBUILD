# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NoRCE
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=1.18.0
pkgrel=1
pkgdesc='NoRCE: Noncoding RNA Sets Cis Annotation and Enrichment'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('MIT')
depends=(
  r
  r-annotationdbi
  r-biomart
  r-dbi
  r-dbplyr
  r-dplyr
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-go.db
  r-igraph
  r-iranges
  r-keggrest
  r-png
  r-rcurl
  r-reactome.db
  r-readr
  r-reshape2
  r-rsqlite
  r-rtracklayer
  r-rwikipathways
  r-s4vectors
  r-stringr
  r-summarizedexperiment
  r-tidyr
  r-zlibbioc
)
optdepends=(
  r-biocgenerics
  r-knitr
  r-markdown
  r-methods
  r-org.ce.eg.db
  r-org.dm.eg.db
  r-org.dr.eg.db
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-org.rn.eg.db
  r-org.sc.sgd.db
  r-rmarkdown
  r-testthat
  r-txdb.celegans.ucsc.ce11.refgene
  r-txdb.dmelanogaster.ucsc.dm6.ensgene
  r-txdb.drerio.ucsc.danrer10.refgene
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.hsapiens.ucsc.hg38.knowngene
  r-txdb.mmusculus.ucsc.mm10.knowngene
  r-txdb.rnorvegicus.ucsc.rn6.refgene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('ceff26719f3fc84a9e1a6065b15b0d5edf34386c797cd3b8a4b2cbd24417f45a')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
  install -Dm644 "${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:
