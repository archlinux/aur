# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=mousam
pkgver=1.3.1
_commit=2d57ba088972d532560b1055bd95bfa4b2680147
pkgrel=1
pkgdesc='Beautiful and lightweight weather app build using Gtk4, Libadwaita and Python'
url="https://github.com/amit9838/mousam"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('python-gobject' 'libadwaita' 'python-cairo' 'python-requests')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#commit=$_commit")
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
}
