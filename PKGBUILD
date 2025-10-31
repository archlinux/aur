# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=occugene
_pkgver=1.70.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Functions for Multinomial Occupancy Distribution"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d36cb86647d70fc1985964d5ed872281')
b2sums=('31798634bef951099adbfc8e2f97f214c0b0bb2fbed606a4649438916a3ec23d8bc2a9c1280be00f4237ab35e9003a6467028764a77b1eec299b252143e0812b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
