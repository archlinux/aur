# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mdqc
_pkgver=1.64.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Mahalanobis Distance Quality Control for microarrays"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a9dd8adf71b5fe15b4b5b444f0b43110')
b2sums=('da3d54dca4040710841adb56c505fa50a28d0d55eca6ebe0efc5db3dc17bc1caff846ac0690bdee130e12f0ba3caff27724890d721bb6555133ef67024c803db')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
