# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=VariantAnnotation
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Annotation of Genetic Variants"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-curl
  r-dbi
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-matrixgenerics
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-seqinfo
  r-summarizedexperiment
  r-xvector
  bzip2
  curl
  xz
  zlib
)
makedepends=(
  r-rhtslib
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg19
  r-genomeinfodb
  r-ggplot2
  r-httr
  r-jsonlite
  r-knitr
  r-magick
  r-polyphen.hsapiens.dbsnp131
  r-rjsoncons
  r-runit
  r-sift.hsapiens.dbsnp132
  r-sift.hsapiens.dbsnp137
  r-snplocs.hsapiens.dbsnp144.grch37
  r-snpstats
  r-txdb.hsapiens.ucsc.hg19.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('96879f37b37f8407b57701ae0a125615')
b2sums=('18ee61622ab345b9ab3bd2551811cace5da76f642a8d7707885d03a47fa4b077e8e18e30ae7f154aa68364cd0bd4b7c6256733ddb72dfa8d0703a45ab5749433')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
