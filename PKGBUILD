# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=multitaper
_pkgver=1.0-17
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Spectral Analysis Tools using the Multitaper Method"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  lapack
  r
)
makedepends=(
  gcc-fortran
)
optdepends=(
  r-fftwtools
  r-psd
  r-slp
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('b06203f832564a39ecea719b2d006771')
b2sums=('6c935f324b68788edeb7cb2064af6a852c783679141eee0178e2dfe9598c81e8fe8755844dc51abb6f9f730d4122789177e4ef20230363ec9a1a1bc5b6c3c6c4')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
