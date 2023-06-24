# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=aroma.apd
_pkgver=0.7.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A Probe-Level Data File Format Used by 'aroma.affymetrix' [deprecated]"
arch=(any)
url="https://cran.r-project.org/package=${_pkgname}"
license=(LGPL)
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
sha256sums=('9d60ead247edb7bf8d172f14881222adda0893a693f997b0da00c29cfd37d1f6')

build() {
  mkdir -p build
  R CMD INSTALL "$_pkgname" -l build
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
