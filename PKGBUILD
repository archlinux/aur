# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Kiri <kiri@vern.cc>

_pkgname=regsem
_pkgver=1.9.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Regularized Structural Equation Modeling"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  blas
  lapack
  r-lavaan
  r-rcpp
  r-rsolnp
)
makedepends=(
  r-rcpparmadillo
)
optdepends=(
  r-caret
  r-colorspace
  r-ga
  r-glmnet
  r-islr
  r-knitr
  r-lbfgs
  r-markdown
  r-matrixstats
  r-nlcoptim
  r-nloptr
  r-numderiv
  r-optimx
  r-plyr
  r-psych
  r-semplot
  r-snowfall
  r-stringr
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c248f10f794c10229eba611f3e252dd4')
b2sums=('23c6b3dc00b13fa2c4c80e7916ab4b4cf398285b7aba01479639a818ad669d11e15c4e43051fc7f5f1cac98b080e924ec54e0ba8208095bda558d30fbf8dcabc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
