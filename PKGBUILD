# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=deming
_pkgver=1.4-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Deming, Theil-Sen, Passing-Bablock and Total Least Squares Regression"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7cd27a3cf31d4885c593d5eee49346e6')
b2sums=('a63add652a7ac456785b0c2180448b9243cc953f601f9dc966ec3b101138b7206688b684a4bee4c5ddd8be5e36ece3de719c346786fefc41afe80c3079a4b0b2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
