# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=doBy
_pkgver=4.6.21
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Groupwise Statistics, LSmeans, Linear Estimates, Utilities"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-broom
  r-cowplot
  r-deriv
  r-dplyr
  r-ggplot2
  r-microbenchmark
  r-modelr
  r-pbkrtest
  r-rlang
  r-tibble
  r-tidyr
)
optdepends=(
  r-geepack
  r-knitr
  r-lme4
  r-markdown
  r-multcomp
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0430aff54f4be6fa47c7eca903d2f81b')
b2sums=('b2d58dbdf2e24b9ff21b8e27300414a001a35d9029adcc3d6aca12f88aca1dca690031b7867e178c6aee765d5d2d536a4be78b6a94dec2ef9ebad4b484883d5a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
