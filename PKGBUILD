# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ctc
_pkgver=1.82.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Cluster and Tree Conversion"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-amap
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ca696caeb4379a4fe9a0a566d978cf77')
b2sums=('29edb8756812fb160754be0f14d88c0110ab5155239f743c24640af50328ea9731b6a702d1c115fcd1e6dca89b7d5670376e1b1eb71a4414f4ba5754adf89364')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
