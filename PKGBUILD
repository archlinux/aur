# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=unitizer
_pkgver=1.4.24
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interactive R Unit Tests"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only OR GPL-3.0-only')
depends=(
  r-crayon
  r-diffobj
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('011f49538abc87be64d57d2a23c91e70')
b2sums=('7b913eb738a6995cb72b4178771ca8d57b2263a45552f75094a1df8c140d0020f160fa29a0b975c93c1bb6a258d8d582d816a87d1b3fe6c4587e26d5bba589ec')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
