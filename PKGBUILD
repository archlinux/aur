# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=simpIntLists
_pkgver=1.50.0
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
md5sums=('e96e16b80e8d0fef6088e639c12bd298')
b2sums=('7514c782cba1c9a5a878100903ec59a3423f326b520351c6f8ba42d1eac688db1d5fa137ac6b24025b73be596b901ae99dc9dafcc1a1b6b1ed09f68c3e48ad4e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
