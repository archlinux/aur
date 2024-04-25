# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=glmx
_pkgver=0.2-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('809eac8845e282100ce327852a725682')
b2sums=('6888d018faf6bcae905986e462a586536b81f32a63c0f57d8c712dfef50dc424af24bd213c2865effb8bcacbd992eba46166b07900357a32277a3d1abdfc8589')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
