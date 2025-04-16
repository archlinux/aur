# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=agilp
_pkgver=3.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Agilent expression array processing package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('494eba85954cab82dca25f8405cabcc9')
b2sums=('461cfc79785793f039339812e9abcd559eda28c81c3212f61d9867dfe7233d0a003d7ace20e275dbec5512f7394b29048498aa6ce21640a1638fe447e5d401ed')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
