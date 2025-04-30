# Maintainer: Guoyi <kuoi@bioarchlinux.org>

_pkgname=dartR.captive
_pkgver=1.0.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//[:-]/.}
pkgrel=1
pkgdesc="Analysing 'SNP' Data to Support Captive Breeding"
arch=('any')
url="https://cran.r-project.org/package=${_pkgname}"
license=('GPL-3.0-or-later')
depends=(
  r
  r-adegenet
  r-crayon
  r-dartr.base
  r-dartr.data
  r-dartr.sim
  r-data.table
  r-ggplot2
  r-patchwork
  r-stringr
)
optdepends=(
  r-fields
  r-gplots
  r-igraph
  r-reshape2
  r-rrblup
  r-scales
  r-siber
  r-spelling
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b2a1a22a89f932b0541da23a3069740e')
b2sums=('09073a6e053167d157ca8d408010d40d783cb85ec21578d67b3e7c66b1a784ec14b6df9e4dce5379d2993e6a0bf695802ad25758cfbd9b28b7f8a35f142612af')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
