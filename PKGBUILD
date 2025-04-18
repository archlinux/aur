# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chromstaRData
_pkgver=1.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="ChIP-seq data for Demonstration Purposes"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d2baf8b0ca8337242e6b646a8e8c53cc')
b2sums=('69172bd100eb014d579115eccd3a77ff49b2e90e9f39270b9d7a6b478c07fade1257464552db8c5c9dbf83cdc452189282f3c342af8618915d48f053d837b921')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
