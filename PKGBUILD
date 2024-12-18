# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sitadela
_pkgver=1.14.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for the easy provision of simple but complete tab-delimited genomic annotation from a variety of sources and organisms"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
  r-biocgenerics
  r-biomart
  r-biostrings
  r-genomeinfodb
  r-genomicfeatures
  r-genomicranges
  r-iranges
  r-rsamtools
  r-rsqlite
  r-rtracklayer
  r-s4vectors
  r-txdbmaker
)
optdepends=(
  r-biocstyle
  r-bsgenome
  r-knitr
  r-rmarkdown
  r-rmysql
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('707012bd9511f0c66885f57ee1c177e7')
b2sums=('69c2d5b3f1e8ccbcd386bc7f84a262ea7f01b42168cdbd55b6a71d38fbcdbb5420982de8f41b59abe8dfa74df1f19d99a35498b029437a22685b5d53cc1a7d8b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
