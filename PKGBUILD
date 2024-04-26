# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=adabag
_pkgver=5.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Applies Multiclass AdaBoost.M1, SAMME and Bagging"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-caret
  r-consrank
  r-doparallel
  r-dplyr
  r-foreach
  r-tidyr
)
optdepends=(
  r-mlbench
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('675cf557792d970a2115e0f7a44f4954')
b2sums=('adbf7343284dc1fec87f54898ff720be13409ee4830c394f9036870016ed36f9d0be0ea8ba546a004ca17fc49fbfd25d485ac504746dbef32284d7ebc4bad7d7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
