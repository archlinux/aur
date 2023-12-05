# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=canvasXpress.data
_pkgver=1.34.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Datasets for the 'canvasXpress' Package"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r
)
optdepends=(
  r-dplyr
  r-tibble
  r-tidyr
  r-usethis
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0df166053851e54ba49dca573d21080a')
sha256sums=('7af8d537f7f2f39b80001169953ebbbfd39c1db3b5aa26c728a997ebc3a2cd81')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
