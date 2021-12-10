# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=cambalache
pkgver=0.8.0
pkgrel=1
pkgdesc='A new RAD tool for Gtk 4 and 3'
arch=(x86_64)
url=https://gitlab.gnome.org/jpu/cambalache
license=(LGPL2.1)
depends=(gtk4 gtk3 webkit2gtk glib2 python-lxml python-gobject)
makedepends=(meson)
checkdepends=()
source=("$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('391dcdea55dc312111cb042e7e9a3577a862a5b096baad3b59862be585649136c37f38e8b04f8cf8b973daa9cf28ebfcae33ac794efb22ef9e77a51c64d9fefa')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
