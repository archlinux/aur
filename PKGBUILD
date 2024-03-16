# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=kriging
_pkgver=1.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=6
pkgdesc="Ordinary Kriging"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-only')
depends=(
  r
)
optdepends=(
  r-maps
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('2ab6d7b85113ece6f21847a6d2968aac')
b2sums=('5fe400f06350cd918e367180b4f8d88560782005d50ce24aac10b099fd9ce6a6d0b8aa2cdc54d2393747c79b820bdf4eff75a5dad83cadd3a3e73727682ebf87')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
