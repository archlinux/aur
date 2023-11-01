# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=cambalache
pkgver=0.16.0
pkgrel=1
pkgdesc='A new RAD tool for Gtk 4 and 3'
arch=(x86_64)
url=https://gitlab.gnome.org/jpu/cambalache
license=(LGPL2.1)
depends=(gtk3 gtk4 webkit2gtk-4.1 webkitgtk-6.0 gtksourceview4 glib2 python-lxml python-gobject libadwaita libhandy gobject-introspection)
makedepends=(meson)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('2483e2f989ccf5bf6d9dd667fd91941993e77fc4a5fc29f9ea64ac2a4db10b0862961c2e1931364e3278ca4edd26f5770e857cb166f4abc7cb14a8802fa29de0')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
