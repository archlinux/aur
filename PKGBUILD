# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RODBC
_pkgver=1.3-26.2
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
md5sums=('17ede00c5f93d4b2bba9f6106379450f')
b2sums=('7f71dc31b791da8b6ce8f3b7bbf996a019b7cb9ad663f269bfec8c902913a111012e56745be2d1b7c7da9d175648e2bdc49c38356c743e90672b810a684da772')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
