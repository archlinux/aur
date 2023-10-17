# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=oaqc
_pkgver=1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Computation of the Orbit-Aware Quad Census"
arch=(x86_64)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r
)
optdepends=(
  r-igraph
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('035a9d6aebcc688ab3cb16d3d47a28cd')
sha256sums=('4e56c8bbe6803223fcef79d35efe08aa18b95efc4d495d6e16b93edfd3a180e5')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
