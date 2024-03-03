# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bcSeq
_pkgver=1.24.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('e582b114bc4743a328b6ada2953a74da')
b2sums=('fbc7c77d884307b41b040199be7ab592b1fef0ce82acac0069367db039e62757abad8c96f591fbd40f0e2f2c0140e188f340de002d5ed3358b8c84f0a2757002')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
