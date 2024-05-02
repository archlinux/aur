# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=agilp
_pkgver=3.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Agilent expression array processing package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('dacbb8ba794a46ebb78d2a5066e6661d')
b2sums=('c8533d9383d8c77e82d4a87ceaa9fe6d8ffc10faab9de54ad9f28d72d5a7f1c6efca9b4529a773f13705e7e63f32f3e73d3e545246f427b3fbf69728e58d5d0e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
