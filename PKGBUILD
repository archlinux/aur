# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=msdata
_pkgver=0.50.0
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
md5sums=('d8cb9351e410ea52dca527cad2392008')
b2sums=('65cd6c6a0ca617cae4728f8e6bc906acc25704f591bfe004aa910d01bce0b5a71bfae8bb1132a7706a4bb440971536a770e79dc18d05cadd3700281234301e8e')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
