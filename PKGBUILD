# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=easycsv
_pkgver=1.0.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Load Multiple 'csv' and 'txt' Tables"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2)
depends=(
  r-data.table
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8f0af88db5c05b948f585bd954fa26e6')
sha256sums=('2f5e843dc068e2773330ea14b86f281e7836f7d6195433afbf459925ce2853c4')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
