# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=Kendall
_pkgver=2.2.2
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Kendall Rank Correlation and Mann-Kendall Trend Test"
arch=(x86_64)
url="https://cran.r-project.org/package=$_pkgname"
license=('GPL-2.0-or-later')
depends=(
  r
)
makedepends=(
  gcc-fortran
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('98be76c85642b99c25911a390879a581')
b2sums=('b7367e03b34ad64f0616b05ee9811247aa146b271d071bafec5c060ec3e64256a376c2d000462feeca66a6da6ed5084c6fa1cd3779eaf9ca950f2bd34a8d97a5')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
