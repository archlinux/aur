# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=fractional
_pkgver=0.1.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Vulgar Fractions in R"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-rcpp
)
optdepends=(
  r-dplyr
  r-ggplot2
  r-knitr
  r-rmarkdown
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e33165a29333e4a8ac11b3e9db006907')
b2sums=('8b94e9312f115311e6a8ab38359a37d02b4e8af33a2bbb035db9c8d2d3dcdbc580cfe8e0acc32f4b11dd52e9da0f032688270c52909025b3ff8bf95d686ba353')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
