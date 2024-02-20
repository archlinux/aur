# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=JASPAR2018
_pkgver=1.1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Data package for JASPAR 2018"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-tfbstools
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d91fce6ea0dc9fa6a3be6ebc05c1af5d')
b2sums=('679990b0931d4e9e76f4dd4bc14fadb183caf8e9da225a86cebfeaf7d85954e3deb9d7d55ff1e8c0a6c21bd0941ebb86aa5f7c12b2a73508f907247e3f4c9eaf')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
