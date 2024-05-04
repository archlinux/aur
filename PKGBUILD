# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=XNAString
_pkgver=1.12.0
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
md5sums=('db4d460d8c4bf061ea721b3214762ded')
b2sums=('20a806ab6df9647c74a93af3e142baa1fc7719b1e6dc183e2553b39b498d5330d9f299d58399812d089ca40d4b6075ccbc58e8b64b051b422762770456f76810')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
