# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=changepoint.np
_pkgver=1.0.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Methods for Nonparametric Changepoint Detection"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-changepoint
  r-rdpack
  r-zoo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f5d7e5bc1fb1add7ba96e38051d2a333')
sha256sums=('c9eeb0be6ec58fc9a44fc5a88a29df4e21430644bcf7d2c28961ae5ac10fd2cf')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
