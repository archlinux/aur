# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=simplermarkdown
_pkgver=0.1.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Simple Engine for Generating Reports using R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-rjson
  pandoc
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('f95ed768046aa0a602b6f7854b26ee4d')
b2sums=('3fe4806efb90c6b59e17c26360188d9f3ace2ed1df1d2f5a0d986537310f67f58e6225302831aa5b382692ea29a3c78b74f6fd6d39492b095d95b495b54bd3a2')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
