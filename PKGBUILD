# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=maCorrPlot
_pkgver=1.82.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Visualize artificial correlation in microarray data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('60cb3d25814a6cf1cf3f63641f533550')
b2sums=('eb5e7f399c9b8d6e088ce4a360e6e57e2339e46ab554b431cf32e1e08c5d4d7945dff8c960dd2270aee85372c48301e0414d6f51e2555dc7b0cb1e6539dfc559')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
