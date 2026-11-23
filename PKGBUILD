# Maintainer: Adityarup Laha <me@adityaruplaha.me>

_pkgname=bread
_pkgver=0.4.1
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Analyze Big Files Without Loading Them in Memory"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-data.table
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('c973a5515a6364533a26d52586f8e557')
b2sums=('b2aca3139d3951d17ee57ef343225a8bfddac70271e14f54903718195e34a7fac374ffadcf8a9a76a422af0926baef8d869bbaad8b60f32614395b3aa8b04e0b')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
