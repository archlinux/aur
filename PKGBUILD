# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=cMap2data
_pkgver=1.43.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Connectivity Map (version 2) Data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1ec4f261bffc24a4e9a38292393b9aca')
b2sums=('75554333e5cb8e252549aee2275ff66d319636c796fcf8afb1fd7f6e831839a91d403e072df2944bbb1413d200013fcbdd429e27ebbf13e2b4fee918ce9983b0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
