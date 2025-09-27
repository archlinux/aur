# Maintainer: nithin <nithin3dev@gmail.com>
pkgname=echo-meter
pkgver=1.1.2
pkgrel=5
pkgdesc="Echo Meter – a modern GTK4 OSD that displays volume, brightness, mic mute, and keyboard lock status"
arch=('x86_64')
url="https://github.com/Nithin-3/echo-meter"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'json-glib')
makedepends=('gcc' 'pkgconf' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c3cf0e3a2e47423f6c652e95c148aeed6808c224c360e4d701ad70d39d507387')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # Install binary
  install -Dm755 echo-meter "$pkgdir/usr/bin/echo-meter"

  # Install assets
  install -d "$pkgdir/usr/share/echo-meter"
  cp -r assets/* "$pkgdir/usr/share/echo-meter/"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}

