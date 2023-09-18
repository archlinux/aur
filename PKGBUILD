# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=mclogit
_pkgver=0.9.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Multinomial Logit Models, with or without Random Effects or Overdispersion"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2)
depends=(
  r-memisc
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fde8195c54f7096ebf8071b67b44ddab')
sha256sums=('9adc5f6d8649960abe009c30d9b4c448ff7d174c455a594cbf104a33d5a36f69')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
