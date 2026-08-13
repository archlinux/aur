# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multicrispr
_pkgver=1.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Multi-locus multi-purpose Crispr/Cas design"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-crisprseek
  r-data.table
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-karyoploter
  r-magrittr
  r-plyranges
  r-rbowtie
  r-reticulate
  r-rtracklayer
  r-seqinfo
  r-stringi
  r-tidyr
  r-tidyselect
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg38
  r-bsgenome.mmusculus.ucsc.mm10
  r-bsgenome.scerevisiae.ucsc.saccer1
  r-ensembldb
  r-genomeinfodb
  r-iranges
  r-knitr
  r-magick
  r-rmarkdown
  r-testthat
  r-txdb.mmusculus.ucsc.mm10.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fa7f0aafdc21f3b5d3c0c3f2a41c6d86')
b2sums=('50a489a9df7718ebb478636f2136951e2fc156523e94fa5466c2d7af7c2dfe804815987eb36dbee0a6049fe29450c8dd3ae46dd30ee9b1db18128ebe7f85f49f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
