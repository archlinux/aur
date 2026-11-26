# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CFAssay
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Statistical analysis for the Colony Formation Assay"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('78493420186bdc2b527120745fec369e')
b2sums=('7c131264f2319510da080661bf3db1a8cd0c605999bfcb1cc2d0ba45de8a026e48f4e716a2f46e557214da15f9ce7ba9e0620986083e0beab1b5c19ffccee830')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
