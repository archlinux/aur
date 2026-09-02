# Maintainer: Pekka Ristola <pekkarr [at] protonmail [dot] com>

_pkgname=MatrixEQTL
_pkgver=2.4
pkgname=r-${_pkgname,,}
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Matrix eQTL: Ultra Fast eQTL Analysis via Large Matrix Operations"
arch=(any)
url="https://cran.r-project.org/package=$_pkgname"
license=('LGPL-3.0-only')
depends=(
  r
)
source=("https://cran.r-project.org/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
md5sums=('113805aa172a905d52b413c2d94ad766')
b2sums=('af1cd50146a710b7213057c576e57c1978c4ccf0e395062b2355e2155206a5294718a6bb0d58724c70234440f160acbc644b4bf70713134db6a24937feb70f87')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"
}
