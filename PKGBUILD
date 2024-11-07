# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=octad.db
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('0afebff9d9a140dbdb280de68a39cc0e')
b2sums=('0bdfbf6afd5967a04b4dd14b72749aee3c038645c38466f8b8bdd55e3c7f073b224422c56589ee5438e8d9d8539df641c7568c0dc00d9ad81f59a39e939d7b71')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
