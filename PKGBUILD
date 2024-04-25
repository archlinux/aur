# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HDCI
_pkgver=1.0-2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="High Dimensional Confidence Interval Based on Lasso and Bootstrap"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
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
b2sums=('1b9f0cbee90ecbb2d7ca64d6dc8200d9c1e21c6fe6cb6a84a71de4f54f7ff09fc2ae564da87e4e397d36b9a3940ca2d685c2b2d821141743e24f3e50b85b2f33')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
