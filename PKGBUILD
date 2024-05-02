# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=occugene
_pkgver=1.64.0
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
md5sums=('5e4ba204a075389ef0e6427b48ff537c')
b2sums=('3b74f6c8fd2c0bde93fbe1621ccd9a025f2f7f9e3d131a167871a2c65ace66f05ad5ea8165d205659a1fbde2f464f66cb55adb0a49275b1ebfead69fc584f865')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
