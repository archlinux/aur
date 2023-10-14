# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=kit
_pkgver=0.0.15
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data Manipulation Functions Implemented in C"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('29b1c1c591f4e3649153c81045e173a3')
sha256sums=('557eee17077157120a129294c10eeaa18ae97d897d460cc3c69a2b3390ebfabf')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
