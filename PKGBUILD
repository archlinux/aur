# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=sagenhaft
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Collection of functions for reading and comparing SAGE libraries"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-sparsem
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9546300f36a4c600915b430f7a982ce1')
b2sums=('3eab05ef7502219dff6268122fb6aeb3ce7f10e67750e20ea886daf37d61ce8cdd2b1dc2c088d5220deb919f742d890318841d7660df2671044bf198c810e00e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
