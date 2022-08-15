# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=cambalache
pkgver=0.10.3
pkgrel=3
pkgdesc='A new RAD tool for Gtk 4 and 3'
arch=(x86_64)
url=https://gitlab.gnome.org/jpu/cambalache
license=(LGPL2.1)
depends=(gtk3 gtk4 webkit2gtk glib2 python-lxml python-gobject libadwaita libhandy gobject-introspection)
makedepends=(meson)
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('968fd12af1ab62a4b99333169aaec65543659297e39d251d3da03bec7119b164750ab7fadc90c209d7953a7601c365619c57dfc922a7fde32083f74d92464084')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
