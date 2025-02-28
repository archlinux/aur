# Maintainer: sukanka <su975853527@gmail.com>

_pkgname=httpgd
_pkgver=2.0.3
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A 'HTTP' Server Graphics Device"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r-unigd
)
makedepends=(
  r-asioheaders
  r-cpp11
)
optdepends=(
  r-covr
  r-future
  r-httr
  r-jsonlite
  r-knitr
  r-rmarkdown
  r-testthat
  r-xml2
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('3ff610a8c300290021f5ec42c1c45ca0')
b2sums=('1181c4894f89fd3c4e324710f8697f539686a5694141316e116ebff1432d20e5af5a69c277233ff1aeabc2c4dd262b4023774d4811eed917d38fde3b2acf5695')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
