# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=lda
_pkgver=1.4.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Collapsed Gibbs Sampling Methods for Topic Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-ggplot2
  r-penalized
  r-reshape2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c48a92925fd43592efd14cac12ff1c5d')
b2sums=('e6dcad13cbfb393029ef8513e9d93564d6a64d05b5c978140c540bc556e4b2e7acc67977f3f16ebfcfa6657e1fe95b18f0c3ea638dd0841eaa9f2c2778a111f6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
