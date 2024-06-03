# Maintainer:

_pkgname="libbismuth"
pkgname="$_pkgname"
pkgver=1.0.5
pkgrel=2
pkgdesc=" Libadwaita's responsive widgets, without all the baggage"
url="https://github.com/tau-OS/libbismuth"
license=('LGPL-2.1-or-later')
arch=('x86_64')

depends=(
  'gtk4'
)
makedepends=(
  'cmake'
  'fribidi'
  'gi-docgen'
  'git'
  'gobject-introspection'
  'meson'
  'ninja'
  'vala'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/$pkgver.$_pkgext")
sha256sums=('e3f9fab6c9870739a10e4ceddec92f3a54ebdf8e45c5b0a50367694976e35187')

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
