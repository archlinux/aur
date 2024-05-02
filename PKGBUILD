# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=splots
_pkgver=1.70.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Visualization of high-throughput assays in microtitre plate or slide format"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-rcolorbrewer
)
optdepends=(
  r-assertthat
  r-biocstyle
  r-dplyr
  r-ggplot2
  r-hd2013sgi
  r-knitr
  r-rmarkdown
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b3b91694471d0f4384d3e57940236085')
b2sums=('bea22087003f9213ecd9e81c2e0a305ce2774d84ee89bc0f38c33f43d2d0f39b5a4d34b5deb0c5f7b82a94a0bca91d39a133ac7e283b86d246b8a560367a6b0a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
