# Maintainer: Matthias Meulien <orontee@gmail.com>

pkgname=argos
pkgver=1.18.0
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
  python-colorlog
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
sha256sums=('2dad6b24b40b9beeae57d79f69308a27124890c4f7362dcce9037aabf0e861fc')

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
