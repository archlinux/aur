# Maintainer: Mitchell Renouf <mitchellarenouf@gmail.com>

pkgname=snapd-glib
pkgdesc="Library to allow GLib/Qt based applications access to snapd, the daemon that controls Snaps"
depends=('libsoup' 'json-glib' 'gobject-introspection')
pkgver=1.57
pkgrel=2
arch=('x86_64')
url="https://github.com/snapcore/snapd-glib"
license=('GPL3')
makedepends=('libsoup' 'json-glib' 'qt5-declarative' 'qt5-base' 'glib2' 'gtk-doc' 'meson' 'ninja')
source=(https://github.com/snapcore/snapd-glib/releases/download/${pkgver}/snapd-glib-${pkgver}.tar.xz)
sha256sums=('b7d9338079ce07b3696d99c5fb6159107d1459e9d9b466daf9980ee331e9e1e7')

build() {
  cd "$pkgbase-$pkgver"
  meson build -Dprefix=/usr
  ninja -C build
}

package() {
  cd "$pkgbase-$pkgver"
  DESTDIR="$pkgdir" meson install -C build
}
