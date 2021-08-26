# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=cambalache
pkgver=0.7.4
pkgrel=1
pkgdesc="A new RAD tool for Gtk 4 and 3"
arch=(x86_64)
url=https://gitlab.gnome.org/jpu/cambalache
license=(LGPL2.1)
depends=(gtk4 gtk3 webkit2gtk glib2 python-lxml python-gobject)
makedepends=(meson)
checkdepends=()
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('1d9a007fcc56cc160427555783a8154c2b8cda2315e1d723827df484fe655c7d03e2b4664cf90792b8f49072dfb22dda9b13715a4e146eaae7e09601eaafab80')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
