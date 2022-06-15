# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=cambalache
pkgver=0.10.1
pkgrel=1
pkgdesc='A new RAD tool for Gtk 4 and 3'
arch=(x86_64)
url=https://gitlab.gnome.org/jpu/cambalache
license=(LGPL2.1)
depends=(gtk3 webkit2gtk glib2 python-lxml python-gobject)
makedepends=(meson)
optdepends=('gtk4: gtk4 workspace')
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a70f132d5cb9fba525670ee380173fd78128245dc443afb25019a10613644e4eb272a63cbb7d2111d63e516fc67591c99b613ff3ae07cebdf976fa5c354041c5')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
