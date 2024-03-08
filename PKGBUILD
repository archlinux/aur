# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=mcbiopi
_pkgver=1.1.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Matrix Computation Based Identification of Prime Implicants"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c77adce837eafd4e4bd4a571bdf6fb7c')
b2sums=('af9735507cbfd920bfa03a3c420b4ba7706c39bba201a4d4550bea03e9d7d09079ab0aa11c29832085830c1c1520dd16979341d79ba22841af8a40292c0dd481')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
