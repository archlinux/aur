# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BiocVersion
_pkgver=3.19.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Set the appropriate version of Bioconductor packages"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('acfbd013ddfbb2047043fb8f8124cba3')
b2sums=('376f672f3b1fddc13cc87c1a617d3f7acd249587b2af841ba78e03b738dbca556e60643c6296412cfe20554114ed64b2f1136beaacb9e196931229874b6b4e61')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
