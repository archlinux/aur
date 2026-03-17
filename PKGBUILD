# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=dartR.data
_pkgver=1.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Auxiliary Data Package for Our Main Package 'dartR'"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-adegenet
  r-crayon
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('540e25b31f3158f41657fed8ba6089a2')
b2sums=('3c8be1b6323f3472c535e3b194872b807f2a47caea25e8d42302e8df09bc67b6c0c686157f362a24f5c806e3e44e5c60fcf1ac41091fe3a9e965d8416e514472')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
