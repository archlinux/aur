# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ARRmNormalization
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Adaptive Robust Regression normalization for Illumina methylation data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-arrmdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('18afc86b2ad195a417a2393582ff125a')
b2sums=('c0ef685011d29ffe9daed24b02f3a0150d1af05ffc821053acfe2546a7022035279165b6297acb46ecd26de2ccc46bb5f43e8803df363513e927dc1ebcb0f68b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
