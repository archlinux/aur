# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=tidydr
_pkgver=0.0.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Unify Dimensionality Reduction Results"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('Artistic-2.0')
depends=(
  r-ggfun
  r-ggplot2
  r-rlang
)
optdepends=(
  r-knitr
  r-prettydoc
  r-rmarkdown
  r-singlecellexperiment
  r-summarizedexperiment
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e8ed646669fb6a8ac418f9273844df05')
b2sums=('608f96e8a573b850c554cd4715b82d1564ccc1685aa8c4e82a19ce30e4ffff54a5bec141d28796135fd4cfcc08e02b8b90e314be2d0d11fa43ab912db68de64c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
