# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=faraway
_pkgver=1.0.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Functions and Datasets for Books by Julian Faraway"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-lme4
)
optdepends=(
  r-leaps
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('526488c5aa96fc1b152b922f28053feb')
b2sums=('eee214136462d5bd24c097f1d6e10f00fa1266ccde245665655e98c4454a39f639334a6b5160ba768fbde21676372fd272056a3d45f7e71a3fa80e94c894eaf9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
