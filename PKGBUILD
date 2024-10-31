# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=BiocBaseUtils
_pkgver=1.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="General utility functions for developing Bioconductor packages"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
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
md5sums=('23940f43a8e0ce95c6cf8780524dcaea')
b2sums=('c360d6d9dbf5dd90cf2e6a4aaa0d4402d1555f43d4bdfa635397c8e4e6b9865ff038511149f661ab80dbecfbdbe0d964598c8fef60c33728920845d49878ac7a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
