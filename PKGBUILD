# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=kit
_pkgver=0.0.19
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Data Manipulation Functions Implemented in C"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c2e614fff5193a266e12a15e5f343bb7')
b2sums=('633a5dff396bd286cd5bd9d2a081b28771b15bc23ce86c3583780c987951a9be100e4155a91e8a0633bd79aa1ea692a5b3244101eb65392998904f175ca31a1e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
