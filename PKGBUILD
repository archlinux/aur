# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chopsticks
_pkgver=1.80.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
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
md5sums=('dd312c6b7793632f83160c7535d78ef0')
b2sums=('6b5b168fa741547599379d2fd477bf7ffddce73e7d71d6ef11588e0ec4d8aa395b06d82784ee2de2dd765ffda618dcf8879b44815c9cd9efd13b569e0f0d73a6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
