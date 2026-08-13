# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=customProDB
_pkgver=1.51.0
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
md5sums=('a5e29f84ab16b49178ad75815adedaef')
b2sums=('b9d0c74ac9b015d80186ec607cd79c00b2c8d4f588beacf96808ff5c4e69942334cbbf3cb0697cbf8e4ce613f622828ae0c0d8286bd7005426775871e804d737')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
