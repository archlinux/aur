# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HSAUR3
_pkgver=1.0-14
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="A Handbook of Statistical Analyses Using R (3rd Edition)"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-ape
  r-coin
  r-flexmix
  r-formula
  r-gamair
  r-gamlss.data
  r-gee
  r-hsaur2
  r-lme4
  r-maps
  r-mboost
  r-mclust
  r-mice
  r-mlbench
  r-multcomp
  r-mvtnorm
  r-partykit
  r-quantreg
  r-randomforest
  r-rmeta
  r-sandwich
  r-scatterplot3d
  r-sf
  r-sp
  r-th.data
  r-vcd
  r-wordcloud
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f2cd2053cefc5025deb4bdc0307249e1')
b2sums=('51e230397ff0f0797d1c283a4c3b7a9d820a97125b6ea3035978ac4f349f54324fd99642d1666e99c62268a8d4250f4fdf32833b580cdefc6913dfa1a4b5a396')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
