# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ReadqPCR
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Read qPCR data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r-biobase
)
optdepends=(
  r-qpcr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b92a0fe88b39abffbc0c46c36a76a8de')
b2sums=('e429f64951a00d4da1c95b83a4f2d1c2d1f5b4d279d34be776ed640b751bf766913eace515f4a0b44c6efd5739cf2d936c88437a46961b29a53175e9824d7bbe')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
