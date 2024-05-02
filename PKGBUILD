# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=IMPCdata
_pkgver=1.40.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Retrieves data from IMPC database"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Apache-2.0')
depends=(
  r-rjson
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3a51e99f06b530de96eed234f3b1f8a9')
b2sums=('9c81c56d5bcfa352e2b29d7d77072c656cdf398b2ed2ca23e60a05bff4e146f29bdf305e7834d956f4577a2af5c6036227eea93a524f266563dc840e712b8363')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
