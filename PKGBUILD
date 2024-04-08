# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affyio
_pkgver=1.72.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Tools for parsing Affymetrix data files"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-zlibbioc
  zlib
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9bd1e4acedbf756386f96d4c1ebb21f3')
b2sums=('f6f89fc05c0da4f2f45fde959387fd133030d179f316adb6d6d8a1cb1483f6e34d111e2015098906a49a40f7efd7bbaf5aa461e8547d96a4fb6eaf96c3a53169')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
