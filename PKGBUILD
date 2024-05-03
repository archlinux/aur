# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PFAM.db
_pkgver=3.19.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A set of protein ID mappings for PFAM"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-annotationdbi
)
optdepends=(
  r-dbi
)
source=("https://bioconductor.org/packages/release/data/annotation/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('aa8de65a2896556444b43883fbf607db')
b2sums=('00658ae28b8a16c0b6975dbadc4162f3990edaea278fead6ccdc83304129c72e700b53b3be26311d50d42e7ff1cb78ce2708a0af3e6150af63a4cb4471058fac')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
