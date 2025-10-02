# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=stacks
_pkgver=1.1.1
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
md5sums=('e08703f88e8b256c90f23f6d22888446')
b2sums=('17450a47810a13dce1fb70a868deb735e27ff1decaaa5b40dfcc89ef33974c52c4614c336f103b86cbbf85985cf030ada655aeee3fc8545474d9cd8a752a5287')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
