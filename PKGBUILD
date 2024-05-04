# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=SPLINTER
_pkgver=1.30.0
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
md5sums=('0cdd3a76c6ad50647a891c96d0bfb12c')
b2sums=('f65555b9aaadbe536485720bfa1cc4f43a9b13229d1fd6a105fa216bd4b4c1024661fc1a29880aa0efd9a9dcb5acfb20044df471255633669b830270f01a012f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
