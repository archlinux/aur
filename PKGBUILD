# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=org.Ce.eg.db
_pkgver=3.20.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genome wide annotation for Worm"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
)
optdepends=(
  r-annotate
  r-dbi
  r-runit
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3b3cbc21c9f362b436ba4a80d9824da4')
b2sums=('0443fe5b2568d2ae42aec09ebfc24dddbf7b7264733b81ee82446ce4a8a3190e2fab5c4b6302e95f27e310f8a2d186405ee03abd969114924715ec615b7ecb47')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
