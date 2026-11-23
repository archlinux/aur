# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=MatchIt
_pkgver=4.8.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Nonparametric Preprocessing for Parametric Causal Inference"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-arg
  r-rcpp
  r-rlang
)
makedepends=(
  r-rcppprogress
)
optdepends=(
  r-cbps
  r-cobalt
  r-dbarts
  r-gbm
  r-glmnet
  r-gurobi
  r-highs
  r-knitr
  r-marginaleffects
  r-matching
  r-optmatch
  r-quickmatch
  r-randomforest
  r-rcppprogress
  r-rgenoud
  r-rglpk
  r-rmarkdown
  r-sandwich
  r-testthat
  r-waldo
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('99b05a812d5b1250f51697a9e57fae1a')
b2sums=('86414c834f0f3a6989f25445e9bdddb09eb19d0009e04e5f7c57bc1398caa527327f9d1ce6a582d5a3bc8c80d793a767dc7c4c4c79f4621264be6bcb72802e6e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
