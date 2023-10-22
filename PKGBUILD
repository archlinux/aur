# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HDCI
_pkgver=1.0-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="High Dimensional Confidence Interval Based on Lasso and Bootstrap"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2)
depends=(
  r-doparallel
  r-foreach
  r-glmnet
  r-iterators
  r-mvtnorm
  r-slam
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('806dea67dc386f8782b82ad5172fb234')
sha256sums=('7fb6f89df772fe8feb9e3e00e567600318b9ec16059c4c20acfef93549d9ab73')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
