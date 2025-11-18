# Maintainer:
# Contributor: Michał Lisowski <lisu@riseup.net>
# Contributor: Thomas Hebb <tommyhebb@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=revelation
pkgver=0.5.6
pkgrel=1
pkgdesc="Password manager for the GNOME desktop"
url="https://github.com/mikelolasagasti/revelation"
license=('GPL-2.0-or-later')
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
source=("$url/releases/download/$_pkgsrc/$_pkgsrc.$_pkgext")
sha256sums=('ceffde10f389e4ec6653e895a2a15ff168d97a51299495c9e089af8a3bef7c53')

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
