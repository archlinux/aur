# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=hexView
_pkgver=0.3-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Viewing Binary Files"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bef9f732bb59add40345f76ded0af94c')
b2sums=('026d65fd59cdc9fd1c6bfbbcd8a6cafa1100f3add3060945a5584b4751a742b2f8d683c9bef1589d66a9d272b5bd8d7b27930164e3437c204a941d8fc5fa20ae')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
