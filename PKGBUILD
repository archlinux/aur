# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=annotatr
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=1.32.0
pkgrel=1
pkgdesc='Annotation of Genomic Regions to Genomic Annotations'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-annotationhub
  r-dplyr
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-iranges
  r-readr
  r-regioner
  r-reshape2
  r-rtracklayer
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-devtools
  r-knitr
  r-org.dm.eg.db
  r-org.gg.eg.db
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-org.rn.eg.db
  r-rmarkdown
  r-roxygen2
  r-testthat
  r-txdb.dmelanogaster.ucsc.dm3.ensgene
  r-txdb.dmelanogaster.ucsc.dm6.ensgene
  r-txdb.ggallus.ucsc.galgal5.refgene
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.hsapiens.ucsc.hg38.knowngene
  r-txdb.mmusculus.ucsc.mm10.knowngene
  r-txdb.mmusculus.ucsc.mm9.knowngene
  r-txdb.rnorvegicus.ucsc.rn4.ensgene
  r-txdb.rnorvegicus.ucsc.rn5.refgene
  r-txdb.rnorvegicus.ucsc.rn6.refgene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('5aefcf093d4f6d9babdad08ffcdf59efe97cfee318af6a68b360910aeb184686')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
