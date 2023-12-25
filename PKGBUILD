# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=MVCClass
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Model-View-Controller (MVC) Classes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2ef3331b86ae7981a2ab3323386caf61')
b2sums=('b341797e797861dbc1e03fe3cb2d393a6b676c2e765c9b7e2c353b2512846a28e4d81d86717b1e2e18b85e5ab75bd46b5337ccd89d19edb91ad31a69f3e5c0ce')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
