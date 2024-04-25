# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=EZtune
_pkgver=3.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Tunes AdaBoost, Elastic Net, Support Vector Machines, and Gradient Boosting Machines"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
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
b2sums=('e5c4f2b521837b0b674faefbca7283d50440980d81cc7235c1fa6a16592e21b9eaf29bd03a8577de22be579c7551f0414edebcb6ec9353fbba1f2ed80d38e52c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
