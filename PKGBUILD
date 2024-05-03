# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=StructuralVariantAnnotation
_pkgver=1.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Variant annotations for structural variants"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-assertthat
  r-biocgenerics
  r-biostrings
  r-dplyr
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-pwalign
  r-rlang
  r-rtracklayer
  r-s4vectors
  r-stringr
  r-summarizedexperiment
  r-variantannotation
)
optdepends=(
  r-biovizbase
  r-bsgenome.hsapiens.ucsc.hg19
  r-devtools
  r-ggbio
  r-ggplot2
  r-knitr
  r-rmarkdown
  r-roxygen2
  r-testthat
  r-tidyverse
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('515b7bbbf0ab76ab0b4e451ce2f2a676')
b2sums=('3f518587d021df0927f7eafa73f67fb248735ad021d53d425efa349bfdb90a2592f898977d8bb25f5826b117f5f30371aba2affb35047777e6265d8fc4679349')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
