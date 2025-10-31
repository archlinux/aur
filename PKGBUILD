# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ecolitk
_pkgver=1.82.0
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
md5sums=('c0d88ac32e30a95e7cb9595fd1481c58')
b2sums=('a58d62dea7cba3bd4503e16e93a404d841363d1b5178a9eeb44dd6f864719051f028368314a54e0d4649775538c5f91bbb8ca69e966a1f2d61fee917a243d4a8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
