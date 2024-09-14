# Maintainer: Carson Buttars <carsonbuttars13@gmail.com>

_pkgname=poissonreg
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=5
pkgdesc="Model Wrappers for Poisson Regression"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-dplyr
  r-generics
  r-glue
  r-purrr
  r-rlang
  r-stats
  r-tibble
  r-tidyr
)
checkdepends=(
  r-testthat
)
optdepends=(
  r-covr
  r-pscl
  r-spelling
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d9a1c0e4b16c40b7f5281d7449333e41')
b2sums=('700216e03db2b03a5fd07c7daa84a84a5b9944b70683e270a16f234d4db8a5f5ad565e0d0582f5f656e5807955124d778d6b72ce10302583199308a5072b7c4f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

#check() {
#  cd "$_pkgname/tests"
#  R_LIBS="$srcdir/build" NOT_CRAN=true Rscript --vanilla testthat.R
#}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
