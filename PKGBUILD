# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DNAcopy
_pkgver=1.84.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="DNA Copy Number Data Analysis"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2f6ecfaf23882e5d8fc23759dad5e876')
b2sums=('89ab4316448e5e75c106ccdd40ce3c11a7c3ef7cab6a30a49d9e2974e12528841fb9d3ca5296245e6de43471328da011099aed7c23df7e9d947fb3890d0e90d0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
