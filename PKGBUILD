# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ecolitk
_pkgver=1.78.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Meta-data and tools for E. coli"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
optdepends=(
  r-affy
  r-ecolicdf
  r-ecolileucine
  r-graph
  r-multtest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9382890863bad6e353aba9689cde885f')
b2sums=('833304fa86ea18a096bc04f12d1854b1f324dee4c8202c3ef5547899335c9fa1429d946d76dc828c4d48c00ff110e97b7fa430d8745204b54cb31fda06b4c299')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
