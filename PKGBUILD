# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=glmx
_pkgver=0.2-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generalized Linear Models Extended"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r-formula
  r-lmtest
  r-sandwich
)
optdepends=(
  r-aer
  r-gld
  r-numderiv
  r-pscl
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('622b9a46463796ee3532426dad3f31d1')
b2sums=('49e59bcf11499b8659411c4d828b7f62053ab79a68be8d2cee9b9386913e2c42fde4e3db80920c5d03c18de51029acabd54f1d119628b6525cc7b750670e9ee8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
