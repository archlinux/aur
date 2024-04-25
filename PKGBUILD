# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=poLCA
_pkgver=1.6.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Polytomous Variable Latent Class Analysis"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-scatterplot3d
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1880d580c0b060ac7708458440462726')
b2sums=('93d26d26a8d172f7d5ff6326f6feaa9c84ccc0282301aff190725b9c9b63ab2fafb98a55b5ee014339615f342c92c6ca251bd7e3dd76bdd93e08b24667e6a498')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
