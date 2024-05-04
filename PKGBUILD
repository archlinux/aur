# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=org.Ce.eg.db
_pkgver=3.19.1
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
md5sums=('ddc102d88169e0bbae26a215fa9e5eda')
b2sums=('a3bb74be1ca1c15ce6cb34a7283479ff6cebc76e31a8a5b40f855a7135b34275412c87fcd35d3d635d13dc047bc2543bbae0d7765dd777fd48d3d30b323757f2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
