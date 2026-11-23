# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=WRS2
_pkgver=1.1-7
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A Collection of Robust Statistical Methods"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-plyr
  r-reshape
)
optdepends=(
  r-car
  r-colorspace
  r-ggally
  r-ggplot2
  r-knitr
  r-mediation
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('18d56daac402dd9d24c539e6462f20d3')
b2sums=('a671741f2f8e9315c783422d212dce60a5d19b702b605da831bc194424d7912a15840aee080078afc4740f31ad7c56f019c76b652d76d3608e8e1daf8a47dd7c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
