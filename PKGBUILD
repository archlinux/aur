# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=PROcess
_pkgver=1.78.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Ciphergen SELDI-TOF Processing"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('Artistic-2.0')
depends=(
  r-icens
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9a9b6e6d31c1c45fb08e1f7cf00f0170')
b2sums=('2f9dd260a13bbfb77f883685d2092de6d6b7ee424e5394300d6af81f0f686ad8ec6d505304c473ac7e1b6f7d003c66dfb1ef120f49f24ac0f4408f65ec870d85')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
