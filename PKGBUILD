# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=cambalache
pkgver=0.10.2
pkgrel=1
pkgdesc='A new RAD tool for Gtk 4 and 3'
arch=(x86_64)
url=https://gitlab.gnome.org/jpu/cambalache
license=(LGPL2.1)
depends=(gtk3 webkit2gtk glib2 python-lxml python-gobject)
makedepends=(meson)
optdepends=('gtk4: gtk4 workspace')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('c9e1e25c2270a7b651a9e4b1edb048467d6c18feba68876cca915986a011a31e911e89b41a760998850f6eaef4a62a96bfb1982f2b396d1d7e1346e9a4f0e028')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
