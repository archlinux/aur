# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=h5vcData
_pkgver=2.22.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Example data for the h5vc package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
optdepends=(
  r-h5vc
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c251316e2d6dc6cb90e8faad0015103b')
b2sums=('4c71488a293cc88ad70e67b166b687b8e156edad74343d5f3d1354ce310d428615591706193bb1faaba58e3e5b4d8b105d328ca77c2529a5ac2c11c908bcd211')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
