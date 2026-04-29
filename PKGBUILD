# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DNAcopy
_pkgver=1.86.0
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
md5sums=('e4ca419dc4356852a35d8a590d6a2ab3')
b2sums=('87dbe20940574d29decd9aa223bcf486207979cab0f22ec093c970a4a92c0f44d4994236d3e72bcaaeaf866f2480971a21c0d8d38fa44badce29da8a02699741')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
