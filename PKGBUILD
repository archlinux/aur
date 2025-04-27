# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=customProDB
_pkgver=1.48.0
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
md5sums=('b5e72b855c59ca46b0edf160740c3ba1')
b2sums=('74c4c6e52c51192f4df6b0c7722141299ba02b96aaaa665e92544854ca1a1aaee0b0331d50e888986c22770cac13b94746e0829700029016f477acf7d1b4bacc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
