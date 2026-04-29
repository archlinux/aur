# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mdqc
_pkgver=1.74.0
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
md5sums=('58a1130e45b107b3821a624eed23b1eb')
b2sums=('490828413a40d23eaf9e86dcec3adb55c62bc40f8ca829bb560f91f9b263a049f8775fb381631da96085ba6fc5160c9d8e537293663fc8952f5205989e80e082')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
