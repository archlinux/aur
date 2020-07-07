# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=video-trimmer
pkgver=0.2.0
pkgrel=1
pkgdesc="Trim videos quickly"
arch=('x86_64')
url="https://gitlab.gnome.org/YaLTeR/video-trimmer"
license=('GPL3')
depends=('gtk3' 'gstreamer')
makedepends=('meson' 'rust')
checkdepends=('appstream-glib')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('b94dd3c3ed745e6dcabbe90e2033464b06b491f60cfd7bdf5788403e23610598')

build() {
	arch-meson "$pkgname-v$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
