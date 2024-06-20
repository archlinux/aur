# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=radio
pkgver=1.0.14
_commit=e2637eec7575c098994bbb775fc04770cdceadd0
pkgrel=1
pkgdesc='Simple Radio for Linux'
url="https://github.com/alexkdeveloper/radio"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('gstreamer' 'json-glib' 'libadwaita' 'libgee' 'libpulse' 'libsoup')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  arch-meson radio build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  ln -s io.github.alexkdeveloper.radio "$pkgdir/usr/bin/radio"
}
