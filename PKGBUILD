# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=FIs
_pkgver=1.31.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Human Functional Interactions (FIs) for splineTimeR package"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d79243a9ea44e9e275127b884025e874')
b2sums=('4f8e552b252b879fee22838569bd29f6119133dbb14cad370354ba45ba491fb722f72e9b1524a92ba9bcf6c6ae2bb5a37d9409090cca88e1b232d570df43ef48')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
