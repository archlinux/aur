# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=parody
_pkgver=1.60.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="Parametric And Resistant Outlier DYtection"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-knitr
  r-rmarkdown
  r-testthat
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b466cc7b30f33e1854daac921ec9dc87')
b2sums=('c201a5757fb43ff1a3a49227bb5e9eb9c78267e10cf258dcd72b088316ff84408f640c2c7b190fadce48f2a39155d0d935a119655147c2fb4b72d43bd79dae23')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
