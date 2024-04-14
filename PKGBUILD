# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=ecolitk
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
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
md5sums=('58667dc1f403986935c98a97f2e0b9e2')
b2sums=('f80d7374b0d6f51014f6246ffe7ee873c753115138004caacc5dac71f387d56bf3285f24902f763e658a6202c8204fb92852a2a41bda866f6b45f385455899f6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
