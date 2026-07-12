# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=freebsdcontribs
_pkgver=0.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="'FreeBSD' Contributor and Commit Statistics"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('CC0-1.0')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('23a83576985ded4b7c04b669547a4c1c')
b2sums=('1afef8922feb19d43be35cead8285b834dbca7f8b8955a4e989d847f3d59ff82670aac07ab16b920098fb0071e67d9d214d1bff36952cf4c9f26f6cefad73cc8')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
