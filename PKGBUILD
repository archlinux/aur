# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multiscan
_pkgver=1.68.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R package for combining multiple scans"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('93865b85f485cd61d19fde9386e3df9d')
b2sums=('bad818a60d2f01e70cd71ebac5ba4363916651ec7d4e7a595acb1ca548654c3174d97292e285692156ad0b3c334d658f1165146c1abb49579700ae656c21cd5f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
