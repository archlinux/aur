# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: sukanka <su975853527@gmail.com>

_pkgname=MatchIt
_pkgver=4.5.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
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
md5sums=('868543cc83c7567510e676e52daf3819')
b2sums=('6597495f6815ddb2f4e7e0355043263da776bbcdc31cb189ce19ad484d4ab350345c0af89b2d9695800b46082303cc1f10bbcda6171bc00931d1c0f71360d65f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
