# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HybridMTest
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Hybrid Multiple Testing"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
  r-fdrtool
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6ae75a9a264df61cfb7044c2928ac5f1')
b2sums=('6cfbce164421e0341a51929b2ab5a9c5e6e1019bc0bfb422b705b07745faeba5acf9e96ce3b8e06093ee4bf21e9676d56877c5ee4651c69a1ba82a6db8d4babb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
