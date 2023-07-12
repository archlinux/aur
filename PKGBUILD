# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MicrobiomeStat
_pkgver=1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Statistical Methods for Microbiome Compositional Data"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(GPL3)
depends=(
  r-foreach
  r-ggplot2
  r-ggrepel
  r-lmertest
  r-matrixstats
  r-modeest
  r-phyloseq
  r-statmod
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e463de42620bebe5a007bad035b20792')
sha256sums=('a486ccbe72f86578b3fac9804e5f87fc30b078bf9eb03b10d3f305555056bac8')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
