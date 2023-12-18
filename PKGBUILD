# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=setRNG
_pkgver=2022.4-1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=8
pkgdesc="Set (Normal) Random Number Generator and Seed"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL2)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('777174614fec2a586a145352bb660784')
b2sums=('628fd4c741def2375e4463c567ba203b6f58a0806e3d6852642a77d4537657eb50b0afa2fdaa38470ef8230c50bb023a00f667c06e846473b6c31318ef0d9e9b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
