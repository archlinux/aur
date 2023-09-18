# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=sampleSelection
_pkgver=1.2-12
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Sample Selection Models"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-formula
  r-maxlik
  r-misctools
  r-mvtnorm
  r-systemfit
  r-vgam
)
optdepends=(
  r-ecdat
  r-lmtest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f64dba3ee084522778f3fe7f33c60ba4')
sha256sums=('be0584c2a017843a2dbc34e9c42d7c5c15992e276bcc5c1b7b47382218e2a1aa')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
