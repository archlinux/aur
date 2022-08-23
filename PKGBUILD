# Maintainer: Blutkoete <tobias dot borgert @ gmail dot com>
# Contributor: 1Conan <me at 1conan dot com>
# Contributor: Mitchell Renouf <mitchellarenouf at gmail dot com>

pkgname=snapd-glib
pkgdesc="Library to allow GLib/Qt based applications access to snapd, the daemon that controls Snaps"
depends=('libsoup3' 'json-glib' 'qt5-declarative')
pkgver=1.61
pkgrel=2
arch=('x86_64')
url="https://github.com/snapcore/snapd-glib"
license=('GPL3')
makedepends=('gobject-introspection' 'gtk-doc' 'meson' 'qt5-tools' 'vala')
source=(https://github.com/snapcore/snapd-glib/releases/download/${pkgver}/snapd-glib-${pkgver}.tar.xz)
sha256sums=('12927eec226edea304d3c08cd4b9808766e423171a3850d66e38705006ed22af')

build() {
  cd "$pkgbase-$pkgver"
  meson build -Dprefix=/usr
  ninja -C build
}

package() {
  cd "$pkgbase-$pkgver"
  DESTDIR="$pkgdir" meson install -C build
}
