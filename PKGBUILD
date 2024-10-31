# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multiscan
_pkgver=1.66.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R package for combining multiple scans"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0e811fc5a4799629af8e512c5b9f0f7d')
b2sums=('530edc713e6e2fd9e943f477be7ef9a205d60cad288e83a6294c84a15a4e73e153d9212c26a89969e7f0b0bad50fe35b180da8dbc341d60317ede1ebfdbbb23a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
