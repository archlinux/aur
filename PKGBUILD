# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=oompaData
_pkgver=3.1.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data to Illustrate OOMPA Algorithms"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Apache-2.0')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b103227bf509aa32f5b74e1c19a06766')
b2sums=('40209e9765976dae961af077798105203dd91ecf6146192e4e0acdf0b7d334769f4592a881ede442d6acdfbfec5952b160290a9fec2af62f3d94bdff41d924e8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
