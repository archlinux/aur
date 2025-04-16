# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=splots
_pkgver=1.74.0
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
md5sums=('c5c7ebdd18b26d03ca930a112a5dfaf8')
b2sums=('bac0f787d403905dd66e9d6e703ed12865aff946e9987c98f72356166cd9be3bdc1474eea47b5f2768855d1f288fbdede01975b93f08e8179b823b70ff49466e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
