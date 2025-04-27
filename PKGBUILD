# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multicrispr
_pkgver=1.18.0
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
md5sums=('3ae2ac94966c119f220ec81ba8e90a24')
b2sums=('936a290b7b8598994a4cc593ffc97868cc0107287ddf13b7e55d212b22dc2e91d14caf2766d062b848be669def5fcc397e63fa588519ea65c7ced8ff500d68d4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
