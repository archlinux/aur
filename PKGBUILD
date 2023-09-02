# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=teleprompter
pkgdesc='A simple Gtk4 application to read scrolling text from your screen'
pkgver=0.1.5
pkgrel=1
arch=('aarch64' 'x86_64')
url="https://github.com/Nokse22/teleprompter"
license=('GPL3')
depends=('libadwaita' 'python')
makedepends=('git' 'meson')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  chmod +x "$pkgdir/usr/bin/$pkgname"
}
