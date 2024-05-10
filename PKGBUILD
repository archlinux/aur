# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=AnVILWorkflow
_pkgver=1.4.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Run workflows implemented in Terra/AnVIL workspace"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-anvil
  r-dplyr
  r-httr
  r-jsonlite
  r-tibble
)
optdepends=(
  r-biocstyle
  r-knitr
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('7b0ea658e72cf47cc1b015652b16ecf4')
b2sums=('d00549a5b96fbf92f9fb63a89478a7b03d184ed4c7aa56681eec683b56d6d5130e63d2d0e2ca00524246493b9e231a2d14bd4e9e5ab0e7fc7ce3d58e4819a2ef')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
