# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=VariantAnnotation
_pkgver=1.52.0
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
md5sums=('dd78ea409fc16978cf2d87763e3b808e')
b2sums=('5cf75fb8b5c99a38ee9af06ed6d63ef396ab6e75911f3914905b7d4c518d9e7d2a45458017064aa2c992b28641037c8c752b26ad6dd073d1ddee9da1b0250fdb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
