# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=scam
_pkgver=1.2-18
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Shape Constrained Additive Models"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('1c7b3bd34ac19b218f2f59415aac50fe')
b2sums=('aca8095bdd05fc706465d15ef9f9147ba1a9a384333f0a6eb41b77a555417606ac7c2cffaeaa8efd157d744d386e035865b85bce29ca2df88b30dfca50b96409')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
