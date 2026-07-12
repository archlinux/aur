# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=simplermarkdown
_pkgver=0.0.6
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="Simple Engine for Generating Reports using R"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-3.0-or-later')
depends=(
  r-rjson
  pandoc
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('a692f54b8cdb625a3472b8f82fe2bd42')
b2sums=('e5a9b594f5f605fcfd8e9875269f7137464e022de43fb1e6ac50e9ba2e5b1addb9406a0a1146a57d8cc5388571c1d347eda2d2974d8657d39d10298b998811e7')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
