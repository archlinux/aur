# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=rBeta2009
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The Beta Random Number and Dirichlet Random Vector Generating Functions"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('167a9e7cae10f102be802b43a7799b1a')
b2sums=('18d2fa99efa44d165355daedea89dfa1f973f534aa62837768e947559045bfe5655b99d066083b5537e2ff1c8ce4b3542b08cffae98569bc1ac728c9c0925f3e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
