# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=AlgDesign
_pkgver=1.2.1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Algorithmic Experimental Design"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('859ea10457d9ae41305c9f8c7081c95c')
b2sums=('a05f5d4b3c54b7cfa65f0651b8dbb31ff6c5a4e15be9ef6fdd572a61443e2621e930d1f56d8d8c6cda8f3d9233b1ddf2a91d6721100a43c731fbd2eefc8cfff2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
