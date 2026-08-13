# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MBCB
_pkgver=1.66.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="MBCB (Model-based Background Correction for Beadarray)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-preprocesscore
  r-tcltk2
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('64c449717008e0ecf17e76552b186e08')
b2sums=('862a9bdd116430d2735c0f12417b339c6d9117e3c5efedfcd271fb3f8e75d242a7f1319a5da81f3c9d35c2acc251a07fdb77ec9b0da56aee26892a09392951a1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
