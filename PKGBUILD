# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=msdata
_pkgver=0.46.0
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Various Mass Spectrometry raw data example files"
arch=(any)
url="https://bioconductor.org/packages/$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
optdepends=(
  r-msnbase
  r-mzr
  r-xcms
)
source=("https://bioconductor.org/packages/release/data/experiment/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('280e355d2ab77124dcf82cf8625e1c4f')
b2sums=('20ca6749e4979d5f5b386715ebf146fbd4217958fab40b9bc59d6894db62c239fbe5625ca0696a57f4d1c43a2b70b0b83afe9232e9b13d40497bbb82a4df3a1a')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
