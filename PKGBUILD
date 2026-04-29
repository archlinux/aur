# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FIs
_pkgver=1.39.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Human Functional Interactions (FIs) for splineTimeR package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d333d95bd120c304d9d6a165f70171a7')
b2sums=('a73e179cf9ee287abe66e14f7f455ec5b672c6c0bc0df118393c1380e02336a7ee4d2ac94ecd8afcad5d5b502c52d4230450edefecb8e77ced74fe764adb92b0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
