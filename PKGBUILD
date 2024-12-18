# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EpiTxDb
_pkgver=1.18.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Storing and accessing epitranscriptomic information using the AnnotationDbi interface"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
  r-biocfilecache
  r-biocgenerics
  r-biostrings
  r-curl
  r-dbi
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-httr
  r-iranges
  r-modstrings
  r-rex
  r-rsqlite
  r-s4vectors
  r-trnadbimport
  r-txdbmaker
  r-xml2
)
optdepends=(
  r-annotationhub
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg38
  r-bsgenome.scerevisiae.ucsc.saccer3
  r-ensembldb
  r-epitxdb.hs.hg38
  r-ggplot2
  r-httptest
  r-knitr
  r-rmarkdown
  r-testthat
  r-txdb.hsapiens.ucsc.hg38.knowngene
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9eaa3d39c3126909d669fd4e98b76ac7')
b2sums=('5d3c367e70bf1c060bcd1d88788a400c970afdeb0677c49a238235567bb5b21347c5c69ca7b58ab06fdf8089968675042cf5b9a4eee2987631ea852c7e016e74')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
