# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=snpStats
_pkgver=1.52.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="SnpMatrix and XSnpMatrix classes and methods"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biocgenerics
  r-zlibbioc
  zlib
)
optdepends=(
  r-hexbin
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0625c920470937a31fd278cf8bd8982a')
b2sums=('2ada9c7f21a9f59558519c9e34328101acd7815e153674a17cb65815471b6ec3570da2daf9f9cf5d4c78fa0c496b350973de312bfdbd223a5180f5ca4e21e2c0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
