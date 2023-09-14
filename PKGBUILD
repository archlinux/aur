# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=HSAUR3
_pkgver=1.0-14
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Handbook of Statistical Analyses Using R (3rd Edition)"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL2)
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
sha256sums=('97af7c47ec07604e9adc48c91300cc6285852c82c5f0742d722e1c4d2ca151bb')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
