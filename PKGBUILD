# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Kiri <kiri@vern.cc>

_pkgname=regsem
_pkgver=1.9.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Regularized Structural Equation Modeling"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
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
sha256sums=('7392bd644efe82f96da0df470a962de398f1d0162273cba1ff31c2ecd7f17a53')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
