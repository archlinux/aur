# Maintainer: Christos Longros <chris.longros@gmail.com>

_pkgname=srsbench
_pkgver=0.1
pkgname=r-${_pkgname,,}
pkgver=$_pkgver
pkgrel=1
pkgdesc="Evaluation Metrics for Spaced Repetition Schedulers"
arch=(any)
url="https://github.com/chrislongros/srsbench"
license=('MIT')
depends=(r)
source=("${_pkgname}_${_pkgver}.tar.gz::https://chrislongros.r-universe.dev/src/contrib/${_pkgname}_${_pkgver}.tar.gz")
sha256sums=('f235537d412229913b2c90d362ae390014dacd28c4ff2b2411e9b401efc3acda')

build() {
  mkdir build
  R CMD INSTALL -l build "$_pkgname"
}

package() {
  install -d "$pkgdir/usr/lib/R/library"
  cp -a --no-preserve=ownership "build/$_pkgname" "$pkgdir/usr/lib/R/library"

  install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
