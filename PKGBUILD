# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Clomial
_pkgver=1.44.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Infers clonal composition of a tumor"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-matrixstats
  r-permute
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('fae2f4780d7c721ebf3819983dd511ab')
b2sums=('a606d7422bdf77b38725123067578f48c6dd03b39650816864e23da10901cd8830cd5e07628103a231ae2d7b99bffe94d7914960900dd54cf293fcfff1ea4eb6')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
