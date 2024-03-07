# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ITALICSData
_pkgver=2.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="ITALICSData"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e154526c43e11840acfd4c92ff1cee8f')
b2sums=('7eb12f7b10e5857711bf826f53512627eb2df1c51312ecb88c0e88f17b2f019d500f83d621600fce4fafd50f2360a802c2cf76dbfdce068e59f9c8cbb4f4c4d1')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
