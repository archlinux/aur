# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rcapture
_pkgver=1.4-4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Loglinear Models for Capture-Recapture Experiments"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2f1d98af31f28b054c0ab61cd7320c86')
b2sums=('b03e3d4cbfd12ba78e385bde08c75e05a332958db19669011dd72680f23c904b3b4fb0141448263ebbf284f4d878ade0deb4e33993ad053b4565b083120eedb2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
