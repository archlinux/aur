# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IDPmisc
_pkgver=1.1.21
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="'Utilities of Institute of Data Analyses and Process Design (www.zhaw.ch/idp)'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-swissair
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2e7d6fc2c0921903a1a584bacf9af609')
b2sums=('059a4d030bdc82c60f0d8112f1c36f0d2baa4563fca9e3e75d5595808a8cda2ddcc431dc7a154697e74bf6b088dd92b79b6023a353d073833e415426eebc49bb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
