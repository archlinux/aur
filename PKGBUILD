# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=cambalache
pkgver=0.16.0
pkgrel=2
pkgdesc='A new RAD tool for Gtk 4 and 3'
arch=(x86_64)
url=https://gitlab.gnome.org/jpu/cambalache
license=(LGPL2.1)
depends=(gtk3 gtk4 webkit2gtk-4.1 webkitgtk-6.0 gtksourceview4 glib2 python-lxml python-gobject libadwaita libhandy gobject-introspection)
makedepends=(meson)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('fc1257377e2e4e0fa00237e9dbd21edfcf828825f3543a20fac346c22e53ebc58900d8c975dc5b540957814f774283db561816f16b74f2e5668b6a1c326b9d49')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
