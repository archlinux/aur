# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=BiocBaseUtils
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="General utility functions for developing Bioconductor packages"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=(Artistic2.0)
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('23ed1406ff70165a763ca2040c46353e')
b2sums=('c48bc9b7fc906b3f7ed5850623abf66ea7ea18858ff30bc0f35c43f027856d6722f7d6c249b249a7b6e07f29b8bd9166c31dd4a5a67f62e18a5fd9c7189d04b3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
