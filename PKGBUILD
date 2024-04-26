# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=octad.db
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Open Cancer TherApeutic Discovery (OCTAD) database"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-experimenthub
)
optdepends=(
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('ef8723031fea32015ee26dbf30d2c8ba')
b2sums=('c9bd1388f79f4eef7fdcc505d0658313ac71dc94c78a66e878d2e6fae7fe4eed33e6a10f4a6312f7f1d0cfdf26665b065f537454552638a72a77c8c13979293b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
