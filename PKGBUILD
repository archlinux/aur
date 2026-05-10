# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bcSeq
_pkgver=1.34.0
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
md5sums=('63165cc9303bc12afb1a8ac721cb3431')
b2sums=('65e5b751d467d28588e35ca840b75886c35d68e43881bd2051c792e491057e11470c370a4a3798363b74796b14ce2d7946b4bbafc35e93ab040e020f61bc9da2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
