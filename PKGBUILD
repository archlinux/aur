# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=EZtune
_pkgver=3.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tunes AdaBoost, Elastic Net, Support Vector Machines, and Gradient Boosting Machines"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-ada
  r-biocstyle
  r-e1071
  r-ga
  r-gbm
  r-glmnet
  r-optimx
  r-rocr
)
optdepends=(
  r-doparallel
  r-dplyr
  r-knitr
  r-mlbench
  r-rmarkdown
  r-rsample
  r-yardstick
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('53c7837a42f53ac7def3dd6eb750d5e3')
sha256sums=('d3d57b42cb436b805fc066ea7e0eb25c164f51795c250eb23eaaf2b5dea29a69')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
