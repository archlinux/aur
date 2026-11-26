# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=multiscan
_pkgver=1.74.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="R package for combining multiple scans"
arch=(x86_64)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-biobase
)
source=("https://bioconductor.org/packages/release/bioc/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('98381b3b8652083b34ef1f0dbae65e9b')
b2sums=('5cb9cd249a8093da2c87c738d7887425e161314298ddbaac9225ba968cf815e650fc35a9aa0cc2a6e5676b595cec960913675e4eb118985fe3cd4fb4c6c50f97')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
