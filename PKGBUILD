# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=QuasR
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Quantify and Annotate Short Reads in R"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-annotationdbi
  r-biobase
  r-biocgenerics
  r-biocparallel
  r-biostrings
  r-bsgenome
  r-genomicfeatures
  r-genomicfiles
  r-genomicranges
  r-iranges
  r-rbowtie
  r-rsamtools
  r-rtracklayer
  r-s4vectors
  r-seqinfo
  r-shortread
  r-txdbmaker
  bzip2
  curl
  xz
  zlib
)
makedepends=(
  r-rhtslib
)
optdepends=(
  r-biocstyle
  r-covr
  r-genomeinfodbdata
  r-genomicalignments
  r-gviz
  r-knitr
  r-rhisat2
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('75ae709da1310fdb157cf187a4f51561')
b2sums=('c329c28c1463d54030ad4982ce4b790c472652a311a6580966b25b2b4c1ddf8658f1c49ca047c661eba601bb6ef1a90fa9b8ba0a597ca563de7abc2e5d474f20')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
