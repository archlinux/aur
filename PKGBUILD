# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=INPower
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="An R package for computing the number of susceptibility SNPs"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-only')
depends=(
  r-mvtnorm
)
optdepends=(
  r-biocgenerics
  r-runit
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fa0384a9705976a082cd592b08b24820')
b2sums=('b568e745bc217b1aec80a4a24d7f0ac367f9fdc217282fca6570cbbaff803ae1232eb839fd0811aeb49387b06ce40997c7f75c8124791513f3ce9bf439b53681')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
