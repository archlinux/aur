# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=glmx
_pkgver=0.2-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Generalized Linear Models Extended"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
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
sha256sums=('fd95fdadc61924a1463d9417161edf62469ba58bcb5e2af4249749f09defcf1d')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
