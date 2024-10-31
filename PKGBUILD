# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fabia
_pkgver=2.52.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Factor Analysis for Bicluster Acquisition"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.1-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c723d86c1d22e511ae29ad03f922be6a')
b2sums=('f4915ace3f3fb1a222514dc05167e17f73b708a450eed1b50fc676650dde91ded990f4e9a39972384f30e39b3279cbaababf24e928ee343c7436b402e707705d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
