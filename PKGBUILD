# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Clomial
_pkgver=1.50.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Infers clonal composition of a tumor"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-matrixstats
  r-permute
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('cedf59d032c788c7524f9e137b0d7dd4')
b2sums=('f85ae0066827ca7aa287d1093fccd35e652b37a7ad191ae43975956dee685b9aa7216dac0e849522325a89eb524ae4c5d650443ff62cb4f09b5f3a91bed76d90')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
