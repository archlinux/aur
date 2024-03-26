# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=trackViewer
_pkgver=1.38.2
pkgname=r-${_pkgname,,}
pkgver=1.38.2
pkgrel=1
pkgdesc='A R/Bioconductor package with web interface for drawing elegant interactive tracks or lollipop plot to facilitate integrated analysis of multi-omics data'
arch=('any')
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
  r-rgraphviz
  r-rhdf5
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-scales
  r-strawr
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
sha256sums=('4603c218d99f42083e32fa7ff8ae1cc24fc6f5954e5d6bcde4c4bee9cdb9fdfd')

build() {
  R CMD INSTALL ${_pkgname}_${_pkgver}.tar.gz -l "${srcdir}"
}

package() {
  install -dm0755 "${pkgdir}/usr/lib/R/library"
  cp -a --no-preserve=ownership "${_pkgname}" "${pkgdir}/usr/lib/R/library"
}
# vim:set ts=2 sw=2 et:
