# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=StructuralVariantAnnotation
_pkgver=1.24.0
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
md5sums=('ac4f8f29d045efae1e14f930a08aec4e')
b2sums=('9b9357760610e4672d5a8b132b82c1a0aac4ed950b8666118e94ea01e28fc9e2ceba119c76f73f7fd14af3644f01ba47428379cd79c8489fd2fb27645e998265')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
