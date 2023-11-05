# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MatrixEQTL
_pkgver=2.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Matrix eQTL: Ultra Fast eQTL Analysis via Large Matrix Operations"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(LGPL3)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a0fef869db8c28dc36a72fe62afd1309')
sha256sums=('881acaba080a836e71302f06b11cbc78c6a5fdbc89d6c8979b84c81657812683')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
