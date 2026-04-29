# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=randPack
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Randomization routines for Clinical Trials"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('98ccbec5c0233e16ec0a23bb4aea6a50')
b2sums=('9cb5dae80c6969e0d02dc9b51080e63e773ca6654f2e6d066ec6af9c29ed7e47bb96e985000d45f91e57fcd40b9c0806065e78910daedcb2e1ded00511195825')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
