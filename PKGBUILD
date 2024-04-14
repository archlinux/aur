# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=factDesign
_pkgver=1.78.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Factorial designed microarray experiment analysis"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('LGPL-2.0-or-later')
depends=(
  r-biobase
)
optdepends=(
  r-affy
  r-genefilter
  r-multtest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('774d444f3227bbac6bc13e48d3974b20')
b2sums=('6b9d121a548d495f8047cee43a5bbf6e2ce3bcb3fc96e0b8f17be02399c5787ec459e9fe6d4670fa331e1ee7d2b0bc6ca1f090b56d01067c51145a19fd206a1b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
