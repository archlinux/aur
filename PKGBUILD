# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mdqc
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Mahalanobis Distance Quality Control for microarrays"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('247f46574ee4c40aa5efaa42d5c6d17a')
b2sums=('bf5e8db58765e765c9bedf6f975a1c63127794cf4c8ea70369907cc597e0abace040fd4dffaa1a6d4e1377502b56e0d1b0cacec929f15180cc946f9a33f6298e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
