# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MeasurementError.cor
_pkgver=1.78.0
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
md5sums=('6f63025944c35b4663e33452890f3a01')
b2sums=('bd5293cee0ead9533e1f1842560d13b3a5129db7d2b204ce8bd6de870a16b73a8eefa5bfc3bc34d3a538c3b7e80fcd8fe5bb624a779bb209cd2f1010f2373e21')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
