# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=preprocessCore
_pkgver=1.76.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A collection of pre-processing functions"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  lapack
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ec847353e3574b3d53dfaa7a56c4f7fc')
b2sums=('15263cda9d976ea0e221739846b413b84313e2b7d725d3ef91a58d1878ce244853e32c54be7b81dfd19c7b50a18462bb715b5dafbb8af89328dd676bfce17f5b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
