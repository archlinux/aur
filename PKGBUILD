# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=dtw
_pkgver=1.23-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Dynamic Time Warping Algorithms"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-proxy
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6357b1e4be790f937be706a7f4b0f38b')
b2sums=('4727177a909e8cae2bb6cf68e9ac1c2f5a485577f5f7d1a54cb4c0615419df88411e573dcab9e34cf53470999f633f4d979f2c76140819dbf5dc84d0f65e3d63')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
