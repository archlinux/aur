# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=DriverNet
_pkgver=1.42.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="uncovering somatic driver mutations modulating transcriptional networks in cancer"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('78b923b016f6bd8097c1edc43ca0cca4')
b2sums=('a900c82293b00cc8d1dcc16dd6a973efea1bdcadc7fb06c2bc71c5e32b62c13134a5ae7b7c9e174a5abda2f805a1a7fd1fee269035aabaea3131e51e7d56a2b6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
