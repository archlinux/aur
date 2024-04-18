# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=lapmix
_pkgver=1.68.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Laplace Mixture Model in Microarray Experiments"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5d2611d1b39b06b05ed64ffab459a5a9')
b2sums=('34eeb6c7ad07294954899f5327fb3902dd05dfb91981d14a34ab2f0e386375c0944489b04d8d3cc48b5c573323807c645cbcf2e841c64b6fe4e89f41cfa3a45d')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
