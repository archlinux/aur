# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MVCClass
_pkgver=1.84.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Model-View-Controller (MVC) Classes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0dbc874160ce5ffa30fd05e86e7ebf00')
b2sums=('4c5ce9942fec8b0b62c677923dbb138314b4a7a506edd210b74e15a66112be141f409b2699c4b37be1886c030599c4b2fb0adbbe83d1accdba565130e85eb0aa')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
