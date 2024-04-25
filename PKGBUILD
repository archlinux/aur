# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aroma.apd
_pkgver=0.7.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=3
pkgdesc="A Probe-Level Data File Format Used by 'aroma.affymetrix' [deprecated]"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-2.1-or-later')
depends=(
  r-r.huge
  r-r.methodss3
  r-r.oo
  r-r.utils
)
optdepends=(
  r-affxparser
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('8378b2a1880dc55fdc8047b63705da05')
b2sums=('9e83a2007a9afc19f29f96935b0b8c8fa20d3d37bbaf98560e2be953a8ae3dadc4b957ec54ce16e09c58ef43327e71f4837d2ee8920b32c147ddbc44554906e3')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
