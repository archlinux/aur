# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=kooha
pkgver=1.0.5
pkgrel=1
pkgdesc="Simple screen recorder for GNOME"
arch=('x86_64')
url="https://github.com/SeaDve/Kooha"
license=('GPL3')
depends=('gstreamer' 'gtk3' 'libhandy' 'python-gobject')
makedepends=('meson')
checkdepends=('appstream-glib')
sha256sums=('10d04f8e710ee1928ed5638f4dfbc929105c0efe7d9e4732eeed08ae7285dec6')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

build() {
	arch-meson Kooha-$pkgver build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
