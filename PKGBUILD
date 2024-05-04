# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=octad.db
_pkgver=1.6.0
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
md5sums=('b7c3100078f9b60f795b2101743fba4b')
b2sums=('d637ec14ecd1c2413afec484b02ebd047d5304bbe4e31cf2c5e78effaf01245e5bf36b0e13fdd12efe4c85ff108c8afe7543d0e2a3dce9e860be2f13c79467c0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
