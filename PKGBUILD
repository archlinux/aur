# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=octad.db
_pkgver=1.10.0
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
md5sums=('c3778b86f1dd1543b6ed21cbc2133f25')
b2sums=('bc02968a7ded130af3c720d2ce5d4e446c41212c78afa79e6a88b7857e5bd630029d9b42bf7d09815c9b86b621fe93ccb532b607501b4e61bbc89d287f7afc4e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
