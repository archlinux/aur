# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=opstakultura
pkgver=1.1.3
pkgrel=1
pkgdesc='A simple knowledge quiz on general culture'
url="https://github.com/dida-code/opstakultura"
arch=('x86_64' 'aarch64')
license=('GPL3')
depends=('python-gobject' 'libadwaita')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
source=("git+$url.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
