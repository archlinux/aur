# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=chopsticks
_pkgver=1.78.0
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
md5sums=('c3d733116a672a7c480ea6614c2f1c7e')
b2sums=('e5f2e46f84d24278ea4b4484ca1ebfdea27f2a4a46b6f76c46b2e3ad20ef3b5375ab84f54c940faa25bc741a87b6ecc804b0750fa1102d148583458c6dbb5f11')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
