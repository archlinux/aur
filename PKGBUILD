# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=adehabitatMA
_pkgver=0.3.17
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Tools to Deal with Raster Maps"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-sp
)
optdepends=(
  r-tkrplot
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('54b0272811d75eba2328bea45c86e38c')
b2sums=('1da72de57b863dcb4b3c40032120516b628733c5606020ab58a66edfd62ad2efaeb08af27baa2851361aa86efae3e950a02c0fff17b90ec4868e3e3194aa6492')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
