# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=XNAString
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Efficient Manipulation of Modified Oligonucleotide Sequences"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-biostrings
  r-bsgenome
  r-data.table
  r-formattable
  r-future.apply
  r-genomicranges
  r-iranges
  r-pwalign
  r-rcpp
  r-s4vectors
  r-stringi
  r-stringr
)
optdepends=(
  r-biocstyle
  r-bsgenome.hsapiens.ucsc.hg38
  r-knitr
  r-markdown
  r-pander
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9227299ff22cd0c02824cd16fcfca7b1')
b2sums=('cca40951d092fb9688f653b30e06fa4fff405f2a6d68711b4c4176cbf1b4b9de57934e2087f881dedb3d867411285aef18fde6462f1fe9b45bb96131877d8c9c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
