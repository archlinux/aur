# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=oompaData
_pkgver=3.1.5
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
md5sums=('7d31b67bd6c5729b457bfee63992e065')
b2sums=('1af871c094322c759b8d0f9d10002d5b6f8561e0734c5ae3142d27f1675ac9baba7d96dddfacbc166c6aa530fb86ecfb79de2f5ab9913007fdc5bd49b1251fbd')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
