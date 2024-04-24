# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=canvasXpress.data
_pkgver=1.34.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Datasets for the 'canvasXpress' Package"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
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
b2sums=('4c6f4252eff70e252dbb6d733f6d7a28fc0061ebc226bce88c0dc77e8eab75b32e46c0ee483db1778333cbe96d427f2df66a4b0695cb97473e72693518632111')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
