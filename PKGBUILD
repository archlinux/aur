# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=stacks
_pkgver=1.0.5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Tidy Model Stacking"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('MIT')
depends=(
  r-butcher
  r-cli
  r-dofuture
  r-dplyr
  r-foreach
  r-future
  r-generics
  r-ggplot2
  r-glmnet
  r-glue
  r-parsnip
  r-purrr
  r-recipes
  r-rlang
  r-rsample
  r-stats
  r-tibble
  r-tidyr
  r-tune
  r-vctrs
  r-workflows
)
checkdepends=(
  r-testthat
)
optdepends=(
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5e703e1abc84f9f846a04aec6b45c86e')
b2sums=('857715e39134ad7e654e0b11586e06345ef6b35c767890d1f4d64d82fc3fcbaf73922f268ea5595643d5e2f0b95dd7e73ad99351f6b297896aa2011da393ca10')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
