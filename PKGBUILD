# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=corrgram
_pkgver=1.14
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=7
pkgdesc="Plot a Correlogram"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-gridbase
  r-knitr
  r-psych
  r-rmarkdown
  r-seriation
  r-sfsmisc
  r-testthat
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a8bf8378b6eecabc911e4d7ca35c573c')
b2sums=('a1c1c94cf3c445226674bc9242924eb68a913cb0203236d46986890f41347e0ca27419e8b744a865e1505e4ae79a2bcf2d5b63b6919baee22cbf0f9093be5c82')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
