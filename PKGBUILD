# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multicrispr
_pkgver=1.12.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Multi-locus multi-purpose Crispr/Cas design"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-assertive.base
  r-assertive.files
  r-assertive.numbers
  r-assertive.reflection
  r-assertive.sets
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-crisprseek
  r-data.table
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-karyoploter
  r-magrittr
  r-plyranges
  r-rbowtie
  r-reticulate
  r-rtracklayer
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
  r-iranges
  r-knitr
  r-magick
  r-rmarkdown
  r-testthat
  r-txdb.mmusculus.ucsc.mm10.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d0bbc847e39772348376d944c884290a')
b2sums=('ed79977a043b0bf57b139d7f304568fd88d7bb7317c673e58f459908fb0330c545243798cdaec86fd56bdf3f0c2e67270e67e0f8f341d280b35b130d4d898be8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
