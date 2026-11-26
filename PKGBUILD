# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=logicFS
_pkgver=2.34.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Identification of SNP Interactions"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-logicreg
  r-mcbiopi
)
optdepends=(
  r-genefilter
  r-siggenes
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9ba9f0869ece50f2a9c74031b088c73b')
b2sums=('ba3ce3a918c6e8700568b4a38d73eda9b49bd7be5fa91353f86f4d65a8f1f7898d8a6df557cd960f939250c98ace3c7df43f75a3212fd6757fd0784ef10be052')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
