# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=changepoint.np
_pkgver=1.0.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Methods for Nonparametric Changepoint Detection"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-changepoint
  r-rdpack
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f5d7e5bc1fb1add7ba96e38051d2a333')
b2sums=('65caf21eed24ed729dd67b7ae4bcb4d5eadad5f986088b5b856e6bbe338563c08b61257fa55bf87a082c0bec2159e2303b13aa3828a41aa8b47774f6af657f1e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
