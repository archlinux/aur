# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MeasurementError.cor
_pkgver=1.76.0
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
md5sums=('51fb950299e999538611749a231aa8aa')
b2sums=('dce14f3ba5184f2efb81a0f3e7c6d02fec5c7a08defab5aab1ce8ffde8554326144180e3bd7093740fbe902888624814bfc956cea90fce789f07236116974b04')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
