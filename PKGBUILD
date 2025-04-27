# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=trackViewer
_pkgver=1.44.0
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
md5sums=('7aacff2683f4d8fed340223e70ed17dc')
b2sums=('a060dfd2f55c6052bc529e72fc2dd61c73e94d6ee622f30185f18c59ed58f2ce1c3d8eaedefaa957d3f02092d4fd0d1bfb11577b3555c13b7811750dfaab4bf0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
