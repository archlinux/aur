# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=VariantAnnotation
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Annotation of Genetic Variants"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  bzip2
  curl
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-biostrings
  r-bsgenome
  r-dbi
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-matrixgenerics
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-summarizedexperiment
  r-xvector
  r-zlibbioc
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
md5sums=('6f929e025221666e81a6adfa17ab0e16')
b2sums=('bd7fa66b6bf37de562985892e6034d8675799219e68be127e14e91c8e83dff804892fdad5c21fe48921d3b78a7897ca8e0e536c7eacea9de6c07b7f106582979')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
