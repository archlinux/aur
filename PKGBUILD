# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=HilbertVis
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Hilbert curve visualization"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=(GPL3)
depends=(
  r
)
optdepends=(
  r-ebimage
  r-iranges
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b30abc9c50034b41daf1399031d657e3')
b2sums=('01bf68e2e9abfb2288f0867103497b6d23631ba7499d3c74956e8fc376ec65b4df95131524cc45e127edbd62ef3662015218b3035f376f95a1bfc717c0d6986b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
