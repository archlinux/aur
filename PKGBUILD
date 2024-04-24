# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=NISTunits
_pkgver=1.0.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=10
pkgdesc="Fundamental Physical Constants and Unit Conversions from NIST"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('5354e46703018bd47f18eecb311029dc')
b2sums=('aedacad168855898f7e6d2226f4ef8041a619178585af7a6875ec914c192efe3125278545d3faa56a1b885ecff414cf222e8a11ab800d200b27941a94a7e419f')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
