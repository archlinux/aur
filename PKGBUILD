# Maintainer: Ronald van Engelen <r.v.engelen+gitlab@gmail.com>

pkgname=alsa-capabilities
pkgver=v2.2.2
pkgrel=1
pkgdesc="List alsa output interfaces and their capabilities and properties"
arch=(any)
url="https://gitlab.com/sonida/alsa-capabilities"
license=(GPL3)
depends=(bash alsa-utils)
options=(!emptydirs !makeflags zipman)
source=($url/-/archive/$pkgver/alsa-capabilities-$pkgver.tar.gz)
sha256sums=('44add47b6b09aeccb94d5ee64c0f91c51af017c87b2f656f6dab56cecd3589d4')
validpgpkeys=(4888EA1E1DD158ED3BC39838FBF05DDFC04DF16B)

build() {
  cd "$pkgname-$pkgver"
  make PREFIX="${srcdir}/usr" install
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}

