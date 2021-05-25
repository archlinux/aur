# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=simple-diary-gtk
pkgver=0.2.1
pkgrel=1
pkgdesc='Simple and lightweight diary app'
arch=('x86_64')
url='https://github.com/johan-bjareholt/simple-diary-gtk'
license=('GPL3')
depends=('libhandy' 'md4c' 'webkit2gtk')
makedepends=('appstream-glib' 'meson')
source=("https://github.com/johan-bjareholt/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('4b51b1b0f4d2c1607e034a6037cad94d34b91256a17bb946a1d4889dae95936d')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
