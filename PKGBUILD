# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chopsticks
_pkgver=1.68.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="The 'snp.matrix' and 'X.snp.matrix' Classes"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
optdepends=(
  r-hexbin
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b63b111068a6d42f7812010d1dc31047')
b2sums=('cb710bc38ba57bc9ecb7e9e81ff0dbcf8e1fe1fca33f22546a3a04c3771bdde027984a8dc443cc146ef8ac7e2ebe362e76cf4db896b18ab6a44f0c656adf611a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
