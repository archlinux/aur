# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=sampleSelection
_pkgver=1.2-14
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Sample Selection Models"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-formula
  r-maxlik
  r-misctools
  r-mvtnorm
  r-systemfit
  r-vgam
)
optdepends=(
  r-ecdat
  r-lmtest
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('29a1a20011a6c55b11f0a16a1afe4444')
b2sums=('82dbe06a544c7d3abf43614219956573e58afe3e66f74d0f3981a9b05dfec416120f0bca078b33f362422bca53699a84890df89eb723ac7ee12425c821073ee9')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
