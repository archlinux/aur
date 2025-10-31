# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=splots
_pkgver=1.76.0
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
md5sums=('b6895bfb6c13b3f70c4945656b73279b')
b2sums=('0b07c658a5a7d35d3707a60573d0b017ce0afbc2e6a980b5965b75fdb0433fcfa47f11d55cf406fcae4dee07a07dbc19c2096ec8bb49d818a31ea24179823303')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
