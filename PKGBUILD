# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=splots
_pkgver=1.68.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
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
md5sums=('5f497af3c7a5fcdbba178a1ff3b411b9')
b2sums=('bac948d312057c8d4ac026a3f04919601aa9087615a859b04a9d0fee914c940590d4265e2a091daa6cdf56a90ee63f8d17d07370b72e36c89f27c41eb263f165')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
