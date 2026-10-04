# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=sampleSelection
_pkgver=1.2-16
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
md5sums=('77aafcef8f79edf0c5a6703bd5ba5a02')
b2sums=('c5e5022667a8ca3f08ca671bd3a4788ada82643fa432be28d6dff7680b95433da6c311c896585cad88ce3e18a2b5fadd88460d7223622e914627e14d0bc17b57')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
