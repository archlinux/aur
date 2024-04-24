# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>
# Contributor: Kiri <kiri@vern.cc>

_pkgname=ssanv
_pkgver=1.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=4
pkgdesc="Sample Size Adjusted for Nonadherence or Variability of Input Parameters"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b31deb0e2ab0dbbf8ed512eb148126ef')
b2sums=('0182b46469296d233f4ee0089d3615f76961086772b88cf476b5fcc8e84187de428c58e80758537a65c51c3bcb04f13f3ad2addf67e4c36034ce484cdbf1b866')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
