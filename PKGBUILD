# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=bcellViper
_pkgver=1.44.0
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
md5sums=('bf9cc2294bc6e8f27f9e06ed39a6b03f')
b2sums=('1453b1d5fbc1b95586c23360e1bc72bc6f60f8fb6eadb4d8fe9a0473eaa9faa77e55e7e0a5c317024e4726a34d7de70f5e1df0bc76f8d598ae9b9331047d2453')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
