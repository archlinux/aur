# Maintainer:
# Contributor: Michał Lisowski <lisu@riseup.net>
# Contributor: Thomas Hebb <tommyhebb@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=revelation
pkgver=0.5.5
pkgrel=2
pkgdesc="Password manager for the GNOME desktop"
url="https://github.com/mikelolasagasti/revelation"
license=('GPL')
arch=('x86_64')

depends=(
  gtk3
  libpwquality
  python-defusedxml
  python-gobject
  python-pycryptodomex
)
makedepends=(
  gobject-introspection
  meson
)

_pkgsrc="$pkgname-$pkgver"
_pkgext="tar.xz"
source=(
  "$url/releases/download/$_pkgsrc/$_pkgsrc.$_pkgext")
sha256sums=(
  'a20c4191595466dc90b90b0f7c4615a599974327152a4d2af87f506134ddce8f'
)

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
