# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=truncreg
_pkgver=0.2-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Truncated Gaussian Regression Models"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-maxlik
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6ddc73494a349da69b23f859ffe89a54')
sha256sums=('3e8e6a09eb0a34f2af8b40eb368c2e47bbd6697e0874b595940cad300b948be9')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
