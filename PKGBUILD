# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=affyio
_pkgver=1.80.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools for parsing Affymetrix data files"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
  zlib
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0c5147bb9f0b683c9296156ee07a77d0')
b2sums=('793f3603995dd537f711a65cb6ae8697c7a9dfb2b68d165cadba59ea632aa7aff58833d1de3cd73cca671208143ecade6795cfee702ba83fab760c827fc2a842')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
