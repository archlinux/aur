# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=AnVILWorkflow
_pkgver=1.0.1
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
md5sums=('351e6afcc0568d82cb69f4fa6efb67ee')
sha256sums=('8f382969d39a8d3a51c67a6aeb6950b8ed5c8dd420c2f475e7da69855860431f')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
