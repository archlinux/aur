# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=dfidx
_pkgver=0.1-0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Indexed Data Frames"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-dplyr
  r-formula
  r-glue
  r-pillar
  r-rdpack
  r-tidyselect
  r-vctrs
)
optdepends=(
  r-knitr
  r-quarto
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3b183bbab14576a438979f1772845f74')
b2sums=('098e8480aa670e10d9fdc037978075e46b5a36598eb32f984dd1bb1581cc93e790983622ef294ac516e01a3cf4dcd4d7922df850b11cf67f9cac2517a1e025fb')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
