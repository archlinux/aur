# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bcSeq
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Fast Sequence Mapping in High-Throughput shRNA and CRISPR Screens"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biostrings
  r-rcpp
)
optdepends=(
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a6753e077fd907d14ca365212f156770')
b2sums=('f286a245a4c63aec6b6402ce4c07231095c6014e52a0ac509cb8f9eb0bc49c6e6b3b208d5ee80906e6a55c66d6bb605cb21355c9cf8ac5b8c05d3628f1da463c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
