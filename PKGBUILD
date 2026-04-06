# Maintainer: Matthias Meulien <orontee@gmail.com>

pkgname=argos
pkgver=1.17.0
pkgrel=1
pkgdesc="Light weight front-end for Mopidy music server"
url="https://github.com/orontee/argos"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
  glib2
  gobject-introspection-runtime
  gtk3
  python-aiohttp
  python-expandvars
  python-gobject
  python-pyxdg
  python-zeroconf
)
makedepends=(
  git
  meson
  python
)
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/orontee/argos/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('195b69688286127c16195761027315ed33f1efd00dc66d4ab82b0e1530e114fc')

install=argos.install

prepare() {
  cd "$pkgname-$pkgver"
  meson setup build --wipe --prefix /usr
}

build() {
  cd "$pkgname-$pkgver"
  meson compile -C build
}

check() {
  echo "No checks available"
}

package() {
  cd "$pkgname-$pkgver"
  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
