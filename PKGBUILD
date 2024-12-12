# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RODBC
_pkgver=1.3-26
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="ODBC Database Access"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r
  unixodbc
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('251426922720470a332ce8d612b4d789')
b2sums=('634daed920a5e9b61c665bb81d775b662d79fde42177fc0d5027bf53917d0a1c420fa3ac0e795beec1c8593ee8cc97b669e4ba1c1512e98cace7d5dab237de91')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
