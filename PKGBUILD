# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multicrispr
_pkgver=1.12.9
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
md5sums=('1eb85739f11d9bac705ffb44aa5cc541')
b2sums=('0d0d6327bdfc5b9dff2a886240a436b506cf6231d1d8602d3fc38ca8cd4ad523b33d99eac82eff829062abe7d2ae4b38ee61369f49f65f8fbb0d1acff0d36551')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
