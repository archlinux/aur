# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MicrobiomeStat
_pkgver=1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Statistical Methods for Microbiome Compositional Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-foreach
  r-ggplot2
  r-ggrepel
  r-lmertest
  r-matrixstats
  r-modeest
  r-statmod
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5af3b2fd4cbb44471678703b43193d84')
b2sums=('9638e1727c3833e49d589f86b81927bc1810f2c406671240a82ccab478b68462f1b6ef0929a88397833383048c577338cd244542b79acea866e719af488a41f2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
