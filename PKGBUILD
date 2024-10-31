# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affyio
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for parsing Affymetrix data files"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-zlibbioc
  zlib
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c1504546527ab09831f56b7d34ba4a34')
b2sums=('4e6161febf3b172ee37d30f6e6d2fce4bc00d6eb12be272162cf84469ada3d53979db088b923495229a209793e14f60c02143fbda0b122a637294b2d66890015')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
