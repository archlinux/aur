# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AneuFinder
_pkgver=1.28.0
pkgname=r-${_pkgname,,}
pkgver=1.28.0
pkgrel=1
pkgdesc='Analysis of Copy Number Variation in Single-Cell-Sequencing Data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-aneufinderdata
  r-bamsignals
  r-biocgenerics
  r-biostrings
  r-cowplot
  r-dnacopy
  r-doparallel
  r-ecp
  r-foreach
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-ggdendro
  r-ggplot2
  r-ggrepel
  r-iranges
  r-mclust
  r-reordercluster
  r-reshape2
  r-rsamtools
  r-s4vectors
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.mmusculus.ucsc.mm10
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('6c06ab05e6f8afda7d8e0c44e68e01b0430b255fafb6a028ddd3fa0bc4f263d0')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
