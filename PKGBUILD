# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=plethy
_pkgver=1.36.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="R framework for exploration and analysis of respirometry data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r-biobase
  r-biocgenerics
  r-dbi
  r-ggplot2
  r-iranges
  r-plyr
  r-rcolorbrewer
  r-reshape2
  r-rsqlite
  r-s4vectors
  r-streamer
)
optdepends=(
  r-biocstyle
  r-runit
)
source=("https://bioconductor.org/packages/3.16/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('449d5f82b30430a259505be9cecae231')
b2sums=('3abdda756f49b1700dc4a2fd1888bf036e1f6b95545771737b95c4f1948ed715e6d5cb6afcf6fb307cda16d755d0cfd1cea2ac4625694cc7f2d397157819a22f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
