# Maintainer: nithin <nithin3dev@gmail.com>
pkgname=echo-meter
pkgver=1.0.1
pkgrel=1
pkgdesc="A GTK4 application for visualizing echo measurements"
arch=('x86_64')
url="https://github.com/Nithin-3/echo-meter"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell' 'json-glib')
makedepends=('gcc' 'pkgconf' 'make')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")

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

