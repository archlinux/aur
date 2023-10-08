# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=MatchIt
_pkgver=4.5.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Nonparametric Preprocessing for Parametric Causal Inference"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL)
depends=(
  r-backports
  r-chk
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
  r-rsymphony
  r-sandwich
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('aed964f649879453bfcb7d45b837e2a5')
sha256sums=('9b9d935042118115aa14536a60b6a28eb92aa29326315aa65952b976fbfc1a9e')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
