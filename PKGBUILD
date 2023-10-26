# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=BiocHail
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="basilisk and hail"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
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
md5sums=('4707c299d0bb3b41001065a753d89f33')
sha256sums=('d56801f227b645e29814530e326c1820e35d5c78aaf6e4afa181f6bc3ad0ba09')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
