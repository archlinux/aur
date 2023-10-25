# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=AnVILWorkflow
_pkgver=1.2.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Run workflows implemented in Terra/AnVIL workspace"
arch=(any)
url="https://bioconductor.org/packages/${_pkgname}"
license=(Artistic2.0)
depends=(
  r-anvil
  r-httr
  r-jsonlite
)
optdepends=(
  r-biocstyle
  r-knitr
  r-tibble
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('af890e3cea3c42346ec887603ba12e40')
sha256sums=('b170a2d4b3389a7f5726135596ace4382cf4886cb0c735c20603c4386fbddb97')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
