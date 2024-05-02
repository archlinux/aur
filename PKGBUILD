# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=RLMM
_pkgver=1.66.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Genotype Calling Algorithm for Affymetrix SNP Arrays"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('71d1f3a4ac2afea8676d9e39f75b16c3')
b2sums=('04bdbf17860330412c9a6acabe24744a2044ff24a8f2e35afd617a4042ffaabc196c9699810cd01091668d5ae2c866270480fc3ec1dab90dd4e137dc416333ca')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
