# Maintainer: Ronald van Engelen <ronalde+gitlab@lacocina.nl>

pkgname=alsa-capabilities
pkgver=v2.0.6
pkgrel=1
pkgdesc="List alsa output interfaces and their capabilities and properties"
arch=(any)
url="https://gitlab.com/sonida/alsa-capabilities"
license=(GPL3)
depends=(bash alsa-utils)
options=(!emptydirs !makeflags zipman)
source=($url/-/archive/$pkgver/alsa-capabilities-$pkgver.tar.gz)
sha256sums=('2d5061a838ab69a3d27c3aeb124617289b80aef1526e18ad501dba90be84b93d')
validpgpkeys=(4888EA1E1DD158ED3BC39838FBF05DDFC04DF16B)

build() {
  cd "$pkgname-$pkgver"
  make PREFIX="${srcdir}/usr" install
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}

