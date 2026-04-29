# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MeasurementError.cor
_pkgver=1.84.0
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
md5sums=('5f836532eba1be8f5db390ac4ac60d03')
b2sums=('900d3a81aee5ace761c18c6e98a75426792b4b3ca998b7d2c852c8560097c62f26acb77d66ca06fded57b179964c45dc516591efe135dafc9c1f4cbb3ce83035')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
