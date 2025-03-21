# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=zigg
_pkgver=0.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=2
pkgdesc="Lightweight Interfaces to the 'Ziggurat' Pseudo Random Number Generator"
arch=('x86_64')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('85fe24786e909c67f009f151efc42e40')
b2sums=('cbcf989b63221d2b82f4b75f12b46dda959113b0c61ed48fcd54ce4113fad7bdfabeb6ab7c56be8cf45b84cd6800136f4ca579c6d697cdd8c6e592e1161cb454')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
