# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=mlr3mbo
_pkgver=1.3.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Flexible Bayesian Optimization"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r-bbotk
  r-checkmate
  r-data.table
  r-lgr
  r-mlr3
  r-mlr3misc
  r-mlr3tuning
  r-paradox
  r-r6
  r-spacefillr
)
optdepends=(
  r-dicekriging
  r-emoa
  r-fastghquad
  r-lhs
  r-libcmaesr
  r-mirai
  r-mlr3learners
  r-mlr3pipelines
  r-moocore
  r-nloptr
  r-processx
  r-ranger
  r-redux
  r-rgenoud
  r-rush
  r-stringi
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ad31215a02b8525465fa3fb9c7680001')
b2sums=('0d2bea36ce857b46b52d26bd17d2a43b87ccfece07a355e07cbf87040901473fdfb1867bff28000ad6fe9f22a47c4baf02065937fb5538d4ad042c69218ba78e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
