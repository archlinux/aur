# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=trackViewer
_pkgver=1.36.1
pkgname=r-${_pkgname,,}
pkgver=1.36.1
pkgrel=1
pkgdesc='A R/Bioconductor package with web interface for drawing elegant interactive tracks or lollipop plot to facilitate integrated analysis of multi-omics data'
arch=('x86_64')
url="https://bioconductor.org/packages/${_pkgname}"
license=('GPL')
depends=(
  r
  r-annotationdbi
  r-biocgenerics
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-graph
  r-grimport
  r-gviz
  r-htmlwidgets
  r-interactionset
  r-iranges
  r-plotrix
  r-rcpp
  r-rgraphviz
  r-rhdf5
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-scales
)
optdepends=(
  r-biocstyle
  r-biomart
  r-htmltools
  r-httr
  r-knitr
  r-motifstack
  r-org.hs.eg.db
  r-rmarkdown
  r-runit
  r-txdb.hsapiens.ucsc.hg19.knowngene
  r-variantannotation
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('21e350548c674e3e5b173e3a2ca0b538174169b5cfbcc4e2657f22e6f7772505')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
