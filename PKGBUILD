# Maintainer: Ronald van Engelen <r.v.engelen+gitlab@gmail.com>

pkgname=alsa-capabilities
pkgver=v2.1.1
pkgrel=1
pkgdesc="List alsa output interfaces and their capabilities and properties"
arch=(any)
url="https://gitlab.com/sonida/alsa-capabilities"
license=(GPL3)
depends=(bash alsa-utils)
options=(!emptydirs !makeflags zipman)
source=($url/-/archive/$pkgver/alsa-capabilities-$pkgver.tar.gz)
sha256sums=('3abd57da52e26153e5f77d36efea46b327cba036cfce69ad21b5e525bc01da7f')
validpgpkeys=(4888EA1E1DD158ED3BC39838FBF05DDFC04DF16B)

build() {
  cd "$pkgname-$pkgver"
  make PREFIX="${srcdir}/usr" install
}

package() {
  cd "$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" install
}

