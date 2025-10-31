# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TCGAbiolinksGUI.data
_pkgver=1.29.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data for the TCGAbiolinksGUI package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-biocstyle
  r-dt
  r-knitr
  r-readr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('13f5e8aefb85b3dc81a4cf2c033b2015')
b2sums=('8e9d37d9ed7f441f72e692654f162d3c9b769be88763156e61d632fb0e7520d54574530f8946a72612246578f864775163bc22cc6a3b530b2eed1cd6797732f0')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
