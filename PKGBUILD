# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=RODBC
_pkgver=1.3-23
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="ODBC Database Access"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r
  unixodbc
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('338d3950ff4d032f32b821d86fb1f882')
sha256sums=('15cdd15ac0afb3294420c7593b04a5e4e31df175418b22a8ec075bf5855e0f3b')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
