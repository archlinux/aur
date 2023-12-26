# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=BufferedMatrix
_pkgver=1.66.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A matrix data storage object held in temporary files"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=(LGPL)
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a4ad95db528526463e6dfca80975815e')
b2sums=('0b407fa0ca1b662e4900aed47c4396cb3119243310177709e959891cda4e70cb5ce5d14163af0af7fd842a4cdb47dcb9c5b43fd7a5bdcabd00e1cbcbf85d50f6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
