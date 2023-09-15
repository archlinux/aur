# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=hexView
_pkgver=0.3-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Viewing Binary Files"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('bef9f732bb59add40345f76ded0af94c')
sha256sums=('cccdedb26a5f926f82ddc1945703198a8a406f02efd3c9e4d18a34bda2c71106')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
