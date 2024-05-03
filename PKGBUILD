# system requirements: bowtie, samtools, and egrep are required for somefunctionalities
# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chimeraviz
_pkgver=1.30.0
pkgname=r-${_pkgname,,}
pkgver=1.30.0
pkgrel=1
pkgdesc='Visualization tools for gene fusions'
arch=('any')
url="https://bioconductor.org/packages/${_pkgname}"
license=('Artistic2.0')
depends=(
  r
  r-annotationdbi
  r-annotationfilter
  r-biocstyle
  r-biostrings
  r-checkmate
  r-data.table
  r-dplyr
  r-dt
  r-ensembldb
  r-genomeinfodb
  r-genomicalignments
  r-genomicranges
  r-graph
  r-gtools
  r-gviz
  r-iranges
  r-magick
  r-org.hs.eg.db
  r-org.mm.eg.db
  r-plyr
  r-rcircos
  r-rcolorbrewer
  r-rgraphviz
  r-rmarkdown
  r-rsamtools
  r-s4vectors
  bowtie
  samtools
)
optdepends=(
  grep
  r-devtools
  r-knitr
  r-lintr
  r-roxygen2
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('76a361ddb79071056564755eb3ce284e426f9c0c4008721422e56c931e2aa2db')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
