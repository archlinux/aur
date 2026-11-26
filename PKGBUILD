# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=EBarrays
_pkgver=2.78.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Unified Approach for Simultaneous Gene Clustering and Differential Expression Identification"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('6300b110111255c211f02ad37217060d')
b2sums=('9bad6738795c8a32a3a4714f831ced4ad6df224c27c74b3e476c643f5a5af55086715e129060172b4fe4a9c138238244030fabdaa6a9c0ca642ce0fc352c7202')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
