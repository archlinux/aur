# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=CMplot
_pkgver=4.5.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Circle Manhattan Plot"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=(GPL)
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('9cf96efd3bf4a1c061d13b5b55188b0d')
b2sums=('405f35d6376b71076ffd7deb50c3bfe4599f6810e58bf993f42d0c2e1cb90157f2db3d99fb9c86db27ff2653d5b741a1f48f5abb933305227a9600b0d1875aa4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
