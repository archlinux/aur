# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Alex Branham <branham@utexas.edu>
# Contributor: fordprefect <fordprefect@dukun.de>

_pkgname=distr
_pkgver=2.9.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Object Oriented Implementation of Distributions"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-3.0-only')
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
md5sums=('bc9e8b5f0f19f62f47dcf2cd1236729d')
b2sums=('eb1b830ebc4a5d0aa80201c6ba9c36bd5d148f3d3262f413a094feda65b89d8485d8f25db6efc90a59f3e6a0096dfe67467e935b046c74b03c52ed132c10f809')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
