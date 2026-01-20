# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=mousam
pkgver=1.4.2
pkgrel=1
pkgdesc='Weather at a Glance'
url="https://github.com/amit9838/mousam"
license=('GPL-3.0-or-later')
arch=('x86_64' 'aarch64')
depends=('python-gobject' 'libadwaita' 'python-cairo' 'python-requests')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5ad5884d7ff85f6d79d7e518607cfdd5e56b1851c6c33f0d93b38f372f3cbb3f')

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
