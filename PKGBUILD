# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=Rlab
_pkgver=4.5.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Functions and Datasets Required for ST370 Class"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('872ba9dc3f702139eafb9d68d5c5f342')
b2sums=('914beb4ab5adee4204949a06d3dcc922072f178e25d4edd4317a8e18f2de1b00d5cde5828125e4a67b04f8b06f8807755c5c3c3997e0c118a56285afe472967a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
