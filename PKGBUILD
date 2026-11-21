# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=dartR.data
_pkgver=1.2.7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Auxiliary Data Package for Our Main Package 'dartR'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-adegenet
  r-crayon
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0dcce68e749e5eba563415e12a6a4476')
b2sums=('37b83656ebf67160c05d98790e5233a40eaa02ed46f4cc0f80a663e56781b4c718038e7329a33f4196fbffd3cc69cd31893fb367b57b07126e3ca97118c10b79')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
