# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=snpStats
_pkgver=1.58.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('e9b740aa649edeb39f262672061235d1')
b2sums=('a3a1ee2708d66e7fb82ae331d3685a6a33358b40d0e7fe83f4dc81daa3e4bf916518506c51b12b6b3e04617f64de090be9d4569dd96c6e1d817df05f7be8218f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
