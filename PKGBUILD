# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=org.Hs.eg.db
_pkgver=3.23.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Genome wide annotation for Human"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
)
optdepends=(
  r-annotate
  r-dbi
  r-runit
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('813be1921e7bc08c1348dbce9d244d0a')
b2sums=('8e82a64c50930734423ddbd921287a66402bfec1abb3a8fece4a06d00550709e8b120aa0f8594a18aa90c0007ffb60903a5d225a351c99ea59c03355ebebd24e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
