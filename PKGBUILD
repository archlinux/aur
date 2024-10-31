# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=TargetSearch
_pkgver=2.8.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A package for the analysis of GC-MS metabolite profiling data"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-assertthat
  r-ncdf4
)
optdepends=(
  r-biocstyle
  r-knitr
  r-targetsearchdata
  r-tinytest
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('d0d868cbde6b3ca682569e3541ccc4aa')
b2sums=('1ad9d787d0a9c0abb9ae5d86d198417f9656beb7b7aa4d3bda237bc5dfbc8cd9f30a467a5b80aa9aea4fb3ff464cfe291f5cd161261ae2c2932089ee5209026f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
