# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=splots
_pkgver=1.72.0
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
md5sums=('392b3bdf03e72c4ae1e0d619340917df')
b2sums=('fcdb7e2c121d581674827f4fc0127764c1ac3fa18e5d5e097c3896b5adef5717d83a8b55bcc42e022584b1ea23964689ecd203dbb859bf44fa012460b7186a03')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
