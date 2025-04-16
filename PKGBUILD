# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ProtGenerics
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generic infrastructure for Bioconductor mass spectrometry packages"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3ed4167c27adeb7b887aaf84b6fa7f2b')
b2sums=('7873eb3c0a46cfd0e45bab0aa95539a9e8a91468ce85e7f3f1f573839ef6f3200dbe4c6d9a7d2a35210960afdca730435facb04feafead1cb5b4cd023ce15668')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
