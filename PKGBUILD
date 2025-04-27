# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SPLINTER
_pkgver=1.34.0
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
md5sums=('e6912939c7cacb7ebb69facd462b0379')
b2sums=('75f3d5fe7a780f78ab52009b1de1677913365e510bf6aa9aa9b00058c23cc4aa0e1fae8bd22218d9c84d763389fe9cf0951e7e9a8cfb26a26d44419d29d84ad0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
