# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=arg
_pkgver=0.2.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Clean and Simple Argument Checking"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-cli
  r-rlang
)
optdepends=(
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('12e0e82f08b4c51948028d221535333d')
b2sums=('0cfb3bdb3d5368987b92a197eb6af8425d5e14f6e5f735968477f4fdc33d5a1454da8aa8792588e23bbddb3a250b68ee8b3ae4f58c7ef8328aff8a567b6253e9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
