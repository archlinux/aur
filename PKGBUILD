# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=mousam
pkgver=1.0.2
pkgrel=1
pkgdesc='Beautiful and lightweight weather app build using Gtk4, Libadwaita and Python'
url="https://github.com/amit9838/mousam"
license=('GPL3')
arch=('x86_64' 'aarch64')
depends=('libadwaita' 'python')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson mousam build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
  chmod +x "$pkgdir/usr/bin/mousam"
}
