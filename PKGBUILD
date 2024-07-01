# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=mousam
pkgver=1.3.2
_commit=d05573ba49cfd16e6d20e35c85ae27710a2cb9cc
pkgrel=1
pkgdesc='Weather at a Glance'
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
