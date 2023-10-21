# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=oompaBase
_pkgver=3.2.9
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Class Unions, Matrix Operations, and Color Schemes for OOMPA"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(Apache)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e4697828589889278211385df36c0dcc')
sha256sums=('14ca2b8e713a6a7ce13758f7f5c183dbc4fdfedc4f1244ca31bbdadf8a16bcb2')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
