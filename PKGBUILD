# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=kooha
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple screen recorder for GNOME"
arch=('x86_64')
url="https://github.com/SeaDve/Kooha"
license=('GPL3')
depends=('gstreamer' 'gtk3' 'libhandy' 'python-gobject')
makedepends=('meson')
checkdepends=('appstream-glib')
sha256sums=('121b51d9369b630395c7798874dc66b5c75becfdd60a54f46f40783580d640e7')
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
