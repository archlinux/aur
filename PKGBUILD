# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=trackViewer
_pkgver=1.48.0
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
  r-interactionset
  r-iranges
  r-rhdf5
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-scales
  r-seqinfo
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
md5sums=('0617a9fc933cd1f220372919ddbd6391')
b2sums=('89c170cf9e3ddcb0b703ff359cf8103b4d960f0299ae168639a699233c157bb6120a494dcbe9ae461a528cfb15a63cd553ae5c9b07263a83352e4aca67f82516')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
