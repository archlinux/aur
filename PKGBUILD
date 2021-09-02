# Maintainer: Ronald van Engelen <ronalde+gitlab@lacocina.nl>

pkgname=alsa-capabilities
pkgver=v2.0.5
pkgrel=4
pkgdesc="List alsa output interfaces and their capabilities and properties"
arch=(any)
url="https://gitlab.com/sonida/alsa-capabilities"
license=(GPL3)
depends=(bash alsa-utils)
options=(!emptydirs !makeflags zipman)
source=($url/-/archive/$pkgver/alsa-capabilities-$pkgver.tar.gz)
sha256sums=('9c6fb24fa7bde8489b5e09d0129cfe9f61cd07bb9974b645f2a6f6b7c0751c32')
validpgpkeys=(4888EA1E1DD158ED3BC39838FBF05DDFC04DF16B)

build() {
  cd "$pkgname-$pkgver"
  make PREFIX="${srcdir}/usr" install
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}

