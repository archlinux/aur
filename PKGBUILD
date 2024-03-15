# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ica
_pkgver=1.0-3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
pkgdesc="Independent Component Analysis"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('815620614ba5a3ca34f11af0e60c9269')
b2sums=('e3e1e1a5d8be2e14891277d1f63131ca2d5317e176d2a3352a46b89160f3b992640d1167104e2dbfe0bbcf7007d848e7e65ff7a18f9a9d5c829a82ac8bb83e0a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
