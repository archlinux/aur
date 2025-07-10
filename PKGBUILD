# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sampling
_pkgver=2.11
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Survey Sampling"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-lpsolve
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2858cd4ef79896fe2d6dfedb63b73a72')
b2sums=('64512dedbb677c72a6082df62f827049cdd6f7d35536da21adb95d8f85cfc07677b43c96153901148d87caf2c2582cd6928a2db81a86c646a28c67224e6f4f8d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
