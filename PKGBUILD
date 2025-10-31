# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MeasurementError.cor
_pkgver=1.82.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Measurement Error model estimate for correlation coefficient"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a66df8c188f09c71fe445b5599a46a9f')
b2sums=('d21a41a29291441c962b3f6f6054b72d7abfa92f6fe118a2b3527b3778da70412e76019d8badf64fac9caf5a6545d2b17a7f8c826273d5671eef2dab1ff257da')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
