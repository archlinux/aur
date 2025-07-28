# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=adabag
_pkgver=5.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('bbb73fbe0e71223af73d350fd049e233')
b2sums=('6a44ecfc18f2fa902c785d4c088dce8b0ac85f65e130df92777227fad3d54206cdd11c0899a5a5fa4f4384098d737788e82b79ba07afdbe8050588bb0756bdf4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
