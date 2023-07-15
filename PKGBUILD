# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Alex Branham <branham@utexas.edu>
# Contributor: fordprefect <fordprefect@dukun.de>

_pkgname=distr
_pkgver=2.9.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Object Oriented Implementation of Distributions"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(LGPL3)
depends=(
  r-sfsmisc
  r-startupmsg
)
optdepends=(
  r-distrex
  r-distrmod
  r-knitr
  r-roptest
  r-svunit
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('434704907b6994db505b19a50564b007')
sha256sums=('b52a817ed66b75defb009e2f946472ab87f693f63c43638e86b5482cd39a2e30')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
