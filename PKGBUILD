# Maintainer: sukanka <su975853527@gmail.com>
# Contributor: Robert Greener <me@r0bert.dev>

_pkgname=gbRd
_pkgver=0.4.12
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Utilities for Processing Rd Objects and Files"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f260c314af4c9884046e130c5e4212f7')
b2sums=('561738150ded96715012cf8eebd8013425099f49d392747f7f96a10bc2339a3e10c426b34d3cd2d839acd0b348e0912b7a3e6e485722b9648b53b5c80cab3bfc')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
