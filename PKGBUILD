# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bcellViper
_pkgver=1.43.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Human B-cell transcriptional interactome and normal human B-cell expression data"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('919d3bce15dc98d8a297bbd9b6924f5b')
b2sums=('f27e4df076afecdbe6bc72ac84a3de945de99cc11e2932b8d9e123a356d9f49346ba630a9a426bbfbeb3e2f8e401be4b1ab150e95048b518ee4aa2c5e5c01e1c')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
