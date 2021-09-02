# Maintainer: Ronald van Engelen <r.v.engelen+aur@gmail.com>

pkgname=alsa-capabilities
pkgver=v2.0.9
pkgrel=1
pkgdesc="List alsa output interfaces and their capabilities and properties"
arch=(any)
url="https://gitlab.com/sonida/alsa-capabilities"
license=(GPL3)
depends=(bash alsa-utils)
options=(!emptydirs !makeflags zipman)
source=($url/-/archive/$pkgver/alsa-capabilities-$pkgver.tar.gz)
sha256sums=('fb8a56b5ee97841e587bde81a69ea35da141fde7631a6f38ba718a87893d5883')
validpgpkeys=(4888EA1E1DD158ED3BC39838FBF05DDFC04DF16B)

build() {
  cd "$pkgname-$pkgver"
  make PREFIX="${srcdir}/usr" install
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}

