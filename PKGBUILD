# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=GenVisR
_pkgver=1.29.3
pkgname=r-${_pkgname,,}
pkgver=1.29.3
pkgrel=3
pkgdesc='Genomic Visualizations in R'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biocgenerics
  r-biomart
  r-biostrings
  r-bsgenome
  r-data.table
  r-dbi
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-gridextra
  r-gtable
  r-gtools
  r-iranges
  r-plyr
  r-reshape2
  r-rsamtools
  r-scales
  r-variantannotation
  r-viridis
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.hsapiens.ucsc.hg38
  r-formatr
  r-knitr
  r-rmarkdown
  r-rmysql
  r-roxygen2
  r-testthat
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-txdb.hsapiens.ucsc.hg38.knowngene
  r-vdiffr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('e2fed67a3560219b741b10701150377e616aee5e542a0b30a70dc979656f0c63')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
