# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=trackViewer
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A R/Bioconductor package with web interface for drawing elegant interactive tracks or lollipop plot to facilitate integrated analysis of multi-omics data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-annotationdbi
  r-biocgenerics
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-grimport
  r-gviz
  r-htmlwidgets
  r-igraph
  r-interactionset
  r-iranges
  r-plotrix
  r-rhdf5
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-scales
  r-strawr
  r-txdbmaker
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
md5sums=('345c5b2adf6e31e2aee1335391d07d48')
b2sums=('82d18d278509969ff57344980481c577f00bbaea59d88fb56cf558d581d6978af1659be2cd74e670a2cd06fc56258c040d36fb1e6069c1bee7a3a817ed0415fa')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
