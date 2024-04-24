# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RODBC
_pkgver=1.3-23
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="ODBC Database Access"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r
  unixodbc
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('338d3950ff4d032f32b821d86fb1f882')
b2sums=('9ba71aacad85f2eae40b3e6f1f991fdf22d749ba14c6615182eb9c9d587831a898c0dc71ca939426d2e027f6c08fbe1370eaf73d1ca46d8785e1d7d738cc1584')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
