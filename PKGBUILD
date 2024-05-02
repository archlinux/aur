# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ARRmData
_pkgver=1.39.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Example dataset for normalization of Illumina 450k Methylation data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('017868883084a475d5bffacd8542aaf7')
b2sums=('e9a0852656f696b1b545a567dcbfb0ba48a3c333a0dee723e7f641f23a60fbf607bd05881d68fe357987616f40ee4dfe7a487d27cc5e5a3a440c9983cb8fd511')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
