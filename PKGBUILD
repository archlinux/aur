# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EpiTxDb
_pkgver=1.24.0
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
  r-genomicfeatures
  r-genomicranges
  r-httr
  r-iranges
  r-modstrings
  r-rex
  r-rsqlite
  r-s4vectors
  r-seqinfo
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
md5sums=('087ad9d1ee14b1ec69c4dc45ede0ebae')
b2sums=('e2f88b94bc1f675dc5cdbddc9a4e801dd8baf4948aa5a14baed43fe65271f8627bbe190ab3259338055e78a4786f7d45603211e542617968c6e3862970f7a4bc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
