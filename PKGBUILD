# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bcellViper
_pkgver=1.50.0
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
md5sums=('031d6e017b359b9570c2f44bd4f6e3a0')
b2sums=('a46a48978801169cccf1c1b212397f9315c041f55e3502ab202faca81b40f487e0a05d867b6d38592b0420aadd9065d7baf9d6675e3603600537d3bf1bb1ffb7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
