# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=QuasR
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Quantify and Annotate Short Reads in R"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  bzip2
  curl
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-genomeinfodb
  r-genomicfeatures
  r-genomicfiles
  r-genomicranges
  r-iranges
  r-rbowtie
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-shortread
  r-txdbmaker
  xz
  zlib
)
makedepends=(
  r-rhtslib
)
optdepends=(
  r-biocstyle
  r-covr
  r-genomicalignments
  r-gviz
  r-knitr
  r-rhisat2
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8c22163982d49624e6738ee5f2ce5a74')
b2sums=('92a17f851af0b48e78d6dc5e54e08edff061cf7bb35655c22d1e26500eb1b34a5410182c9930acd5abf9f014e4122e8a2091e60f329e292a49cda5649f3fc67d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
