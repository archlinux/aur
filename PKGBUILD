# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RODBC
_pkgver=1.3-26.3
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
md5sums=('103599cf39e4ad408a2f981a2bcac8f2')
b2sums=('f360a3a95de57faec64fe1008ef5b94df6f5f74eac891a81dfaead7617241b9119351493c6ecab68394657d5e282b6a1b0260db16b7e3fb50ea666e91eb729ca')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
