# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MatrixEQTL
_pkgver=2.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Matrix eQTL: Ultra Fast eQTL Analysis via Large Matrix Operations"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a0fef869db8c28dc36a72fe62afd1309')
b2sums=('386b68c235f6dbabc499b55ec213b5a37d7fe0e54f384ceea75fb6e41463b00c790cc0331656c793437805c2ff34ba7b1a950a9d1059c67542bed89405d498a6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
