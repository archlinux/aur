# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multiscan
_pkgver=1.62.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="R package for combining multiple scans"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('58243690ff05bdbd30da46ea01e409a3')
b2sums=('221c5aeab39bfab962cbde3bed12c049d03ed7a80531a34880231d0769f26280216165792f44c7fbd5ae98c1d9ee1b34dcd53c92ffd04c6656f01a7e5e023c76')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
