# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BiocHail
_pkgver=1.12.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="basilisk and hail"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-basilisk
  r-biocfilecache
  r-biocgenerics
  r-dplyr
  r-reticulate
)
optdepends=(
  r-biocstyle
  r-dt
  r-ggplot2
  r-knitr
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b3397959db5d770efdeab8a2f04f51e2')
b2sums=('b45c98aad95d65265613d87bce8a49ff6e6a097c11071684d2cef2e0abcfd359fc896ee073f88e0c91e1c7f23056495509ceaec5e8918209cc80d3f3c4b6893f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
