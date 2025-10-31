# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=simpIntLists
_pkgver=1.45.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="The package contains BioGRID interactions for various organisms in a simple format"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('aa65ec77606c419b4d739c5a45876853')
b2sums=('a7cb4a309121a667a52f93c08c3292ff99a8a70edcf41a4a831eafd1e640d6c0cb06c8ae93a135c67bc5c3d47eb9b133c107281cfa4891bd63e503977555c026')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
