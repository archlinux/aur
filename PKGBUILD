# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>
# Contributor: Alex Branham <branham@utexas.edu>
# Contributor: fordprefect <fordprefect@dukun.de>

_pkgname=distr
_pkgver=2.9.7
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
md5sums=('168013c7ac28e8afcfaabcb2cc1bc1f7')
b2sums=('f369e60ce4bae5f2ccc3b360ae919d0ec73b99de3999d44e2fbc3a43e47bb001fe5d5856cb958a4c8ee1f4190c966f6aa1a62984cf95b97f6177350037ef59c0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
