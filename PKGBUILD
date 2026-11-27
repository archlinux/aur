# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=octad.db
_pkgver=1.16.0
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
md5sums=('c835778d6aca5f78313ab32eae4e5f12')
b2sums=('d8838293225f873e57d5bbecbebe30965fc75628d1dd04b51e4a5ba2fc538c105591280871cf1acc1e083ebb3c63d7cd7da37171da87e6ebc649b4f425cae4b6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
