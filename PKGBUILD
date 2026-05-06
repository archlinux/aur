# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=stemHypoxia
_pkgver=1.48.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Differentiation of Human Embryonic Stem Cells under Hypoxia gene expression dataset by Prado-Lopez et al. (2010)"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('486644bb5754a1a8757531585b7bc2a6')
b2sums=('8047b63832d637ad6a7cd265b0365ceecbbabbd11d725ef49191f800eceaa158882afc72fa8b53dd8bbdb9403f3616f1c8c8098c3867a1db3ad995c2231bf99a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
