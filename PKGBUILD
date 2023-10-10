# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=ticketbooth
pkgver=1.0.3.1
pkgrel=1
pkgdesc='Keep track of your favorite shows'
url="https://github.com/aleiepure/ticketbooth"
arch=('x86_64' 'aarch64')
license=('CCPL:0-1' 'LGPL3' 'GPL3-or-later')
depends=('python-tmdbsimple' 'libadwaita')
makedepends=('blueprint-compiler' 'git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlog
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
