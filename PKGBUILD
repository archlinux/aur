# Maintainer: Guoyi Zhang <guoyizhang at malacology dot net>

_pkgname=fmsb
_pkgver=0.7.8
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Functions for Medical Statistics Book with some Demographic Data"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-epi
  r-vcd
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('e33c84c42fc035c050a0d1f9dc2c01b8')
b2sums=('39b3fba6a22ab2a533ea2f830ea2ff763c445bfba077bbdff560e8c70f7bc055234c8d4fbd2c9d6e539a37f3357206531b8d6d95f41f865936720d82e30bab27')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
