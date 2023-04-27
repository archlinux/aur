# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CNEr
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=1.36.0
pkgrel=1
pkgdesc='CNE Detection and Visualization'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotate
  r-biocgenerics
  r-biostrings
  r-dbi
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-ggplot2
  r-go.db
  r-iranges
  r-keggrest
  r-powerlaw
  r-r.utils
  r-readr
  r-reshape2
  r-rsqlite
  r-rtracklayer
  r-s4vectors
  r-xvector
)
optdepends=(
  r-biocstyle
  r-bsgenome.drerio.ucsc.danrer10
  r-bsgenome.ggallus.ucsc.galgal3
  r-bsgenome.hsapiens.ucsc.hg19
  r-bsgenome.hsapiens.ucsc.hg38
  r-gviz
  r-knitr
  r-rmarkdown
  r-testthat
  r-txdb.drerio.ucsc.danrer10.refgene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('cd493d039a1042dc0e0dd2db90ddb796d57bd59706ea0ebc87e1782532735911')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
