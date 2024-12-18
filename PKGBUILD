# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SPLINTER
_pkgver=1.32.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Splice Interpreter of Transcripts"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biomart
  r-biostrings
  r-bsgenome.mmusculus.ucsc.mm9
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-ggplot2
  r-googlevis
  r-gviz
  r-iranges
  r-plyr
  r-pwalign
  r-s4vectors
  r-seqlogo
  r-stringr
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-txdbmaker
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('16b64c57fa376c2bd1fe45c4c30fc810')
b2sums=('8cd58faea6592d2210e7b5bcc2b27d903c2102d6a0be33fec8d7cfa63a5fb37b2880752f88d0612cc7c1a228a6ba39f2c17599482b9fc989c71cdea767051e97')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
