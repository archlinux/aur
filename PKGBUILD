# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=cambalache
pkgver=0.8.1
pkgrel=1
pkgdesc='A new RAD tool for Gtk 4 and 3'
arch=(x86_64)
url=https://gitlab.gnome.org/jpu/cambalache
license=(LGPL2.1)
depends=(gtk4 gtk3 webkit2gtk glib2 python-lxml python-gobject)
makedepends=(meson)
checkdepends=()
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('682586041bb60aaf269b629b716411f5c15e3357f5479387c33240a8a8c2e4f63ffcce6d4682b956b265b2deeab439de340521d4b2a4e3e200e450f5d67196d5')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
