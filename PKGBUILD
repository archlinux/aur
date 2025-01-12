# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=MatchIt
_pkgver=4.7.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Nonparametric Preprocessing for Parametric Causal Inference"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
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
  r-rsymphony
  r-sandwich
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('057b483de13f23ee06df8db660e22d3d')
b2sums=('62bd9898d1daa5284220252c782314bb76b6fc6dcd69fa857c85be64c26f57c95fbe7956ae908c12cc9c2d4cd71ced52e94e82a675dfc172d9fdb9165f6a1256')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
