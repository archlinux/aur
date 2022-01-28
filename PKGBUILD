# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=cambalache
pkgver=0.8.2
pkgrel=1
pkgdesc='A new RAD tool for Gtk 4 and 3'
arch=(x86_64)
url=https://gitlab.gnome.org/jpu/cambalache
license=(LGPL2.1)
depends=(gtk4 gtk3 webkit2gtk glib2 python-lxml python-gobject)
makedepends=(meson)
checkdepends=()
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('ff3fdb3b527bd073eb52e84effd621b226464128dc9c8f3dfd791a019e8420cbda1798db828530d30cbe88949ae0b3ea19c48bff729c493a0b2a00830b90bfcb')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
