# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MVCClass
_pkgver=1.82.0
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
md5sums=('23b166db6ea26cebad092bacd082ee2f')
b2sums=('2a57160f10f38f48df4ec041abad0b143baaba160ca188f7779c6a60090f9bdaaea21273248e45e27cc3a2c0ae44379dbc31f7b9d688f28c44d3fef33203308e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
