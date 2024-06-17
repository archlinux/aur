# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=spatstat.utils
_pkgver=3.0-5
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Utility Functions for 'spatstat'"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-spatstat.model
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('0bec72b2a5c5c6992285cb47b5259c1f')
b2sums=('2743ea7d506ceb69e3a9280ab4c7cf7c4f9af1249d1b38546e77fb917e2d898a974ab7a69f8606ffb7863bfb491bebbde0726c88dd5f473dfb7b0a803ba8c602')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
