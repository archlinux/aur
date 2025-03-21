# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=plm
_pkgver=2.6-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Linear Models for Panel Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-bdsmatrix
  r-collapse
  r-formula
  r-lmtest
  r-maxlik
  r-rdpack
  r-sandwich
  r-zoo
)
optdepends=(
  r-aer
  r-car
  r-fixest
  r-knitr
  r-lfe
  r-pder
  r-rmarkdown
  r-statmod
  r-texreg
  r-urca
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ff9efc50183e92f9b9ca3f70315d6cd5')
b2sums=('27060087f39024aaa0db2e0d816e24c0b1f2fb63a179860003c272adbfbc7c04821a8c07208b146287a7928567fdef4d737505b1c3d6d64e980561cfa81a9123')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
