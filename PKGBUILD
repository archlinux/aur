# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=rRDP
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Interface to the RDP Classifier"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only AND Apache-2.0 AND LGPL-2.1-only')
depends=(
  java-runtime
  r-biostrings
  r-rjava
)
optdepends=(
  r-knitr
  r-rmarkdown
  r-rrdpdata
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('99d24b0d09340118c2e507a559d6bfa2')
b2sums=('2311464586f14f776a281ebfa4ebcc26394bbbc26c4125bc32d36faf08cdf7e95a26d831575db638ac5adb71381707e97812a2755385718302482b3bee5d3024')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
