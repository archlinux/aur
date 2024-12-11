# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=mousam
pkgver=1.4.0
pkgrel=1
pkgdesc='Weather at a Glance'
url="https://github.com/amit9838/mousam"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('python-gobject' 'libadwaita' 'python-cairo' 'python-requests')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6f89f395e0b0a8658ecf6cd79212de44739e3ada0224c1728640e6c88b4270bb')

build() {
  arch-meson mousam-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
