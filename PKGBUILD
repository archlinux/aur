# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=mousam
pkgver=1.5.0
pkgrel=1
pkgdesc='Weather at a Glance'
url="https://github.com/amit9838/mousam"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('python-gobject' 'libadwaita' 'python-cairo' 'python-requests')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7a244483cd22d2c609bab7578761e02a0f35bd3caa24a09d236f69fa48bc3b44')

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
