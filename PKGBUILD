# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=matchBox
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Utilities to compute, compare, and plot the agreement between ordered vectors of features (ie. distinct genomic experiments). The package includes Correspondence-At-the-TOP (CAT) analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b6e4b10ee38f433d1bce146a089a44ec')
b2sums=('3d3ea47607e5966961c870ec60a51cd1cedfd401a2ad81f07b5a869363d86e3fc7d358b17a574ea8222fece45d0b8cdcf63486a0979a7ab2f00fb78941019c13')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
