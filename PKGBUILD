# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=gpls
_pkgver=1.86.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Classification using generalized partial least squares"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ef8590db3e046ea4732c3392a0cda74a')
b2sums=('b53d09e349dd5e9982bb7a72a6dae80979e0ca80a5e3f2498c37144ef238df36506312fe750446ead68ca5fc9e1bb5776b1a4923edd56c1edc361e236099cd3a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
