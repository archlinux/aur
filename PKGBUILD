# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=reformulas
_pkgver=0.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Machinery for Processing Random Effect Formulas"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-rdpack
)
optdepends=(
  r-lme4
  r-tinytest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c10349669436c9cf55f8dd851c8247f7')
b2sums=('17e84d6424730c71c87fff412481ddc4519a9afff3cd095c04b9cb26e762fffde666629a0ddef5fb32cb4eb826f6421d8c1502fbf3bcbd635eb2b2c50a4c4ac3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
