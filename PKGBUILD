# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=objectProperties
_pkgver=0.6.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="A Factory of Self-Describing Properties"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-objectsignals
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('18c1e4e7b82e94ac187d1120c7125c83')
b2sums=('49e735b70beea3395f1deb10e827a74364f4164b6827f266dcde3a00c7d1e7caa1a9f56f8d2d1fa97ae69472e04132c0239222f3dad1cc138f9f6d2c29c054c2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
