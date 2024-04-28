# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=lda
_pkgver=1.5.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Collapsed Gibbs Sampling Methods for Topic Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-2.1-or-later')
depends=(
  r
)
optdepends=(
  r-ggplot2
  r-penalized
  r-reshape2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('299cda6783a587b541b7d57b1e7cb8f3')
b2sums=('70174e2e1b73a25f3b473b4062b4f0cd0b81f2cc02aaf433a6282920520bd2ae9ea9420952fd2fe38adb8dc675a67be45327e26dddc6224bacb56e4b1554615b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
