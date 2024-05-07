# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=customProDB
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generate customized protein database from NGS data, with a focus on RNA-Seq data, for proteomics search"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-ahocorasicktrie
  r-annotationdbi
  r-biomart
  r-biostrings
  r-dbi
  r-genomeinfodb
  r-genomicalignments
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-plyr
  r-rcurl
  r-rsamtools
  r-rsqlite
  r-rtracklayer
  r-s4vectors
  r-stringr
  r-txdbmaker
  r-variantannotation
)
optdepends=(
  r-bsgenome.hsapiens.ucsc.hg19
  r-rmariadb
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fbeece69015d5687c3cc2ff4cd0b6544')
b2sums=('2191f16d8759b32453cc923b72d7c1af4340b12c75f54604e07e7217b0759cdfa61a47ad85d1c46202d9f458d93159f2284c78b106b0a98e25f7b3cfb754a5f4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
