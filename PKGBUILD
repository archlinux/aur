# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=kooha
pkgver=1.0.3
pkgrel=1
pkgdesc="Simple screen recorder for GNOME"
arch=('x86_64')
url="https://github.com/SeaDve/Kooha"
license=('GPL3')
depends=('gstreamer' 'gtk3' 'libhandy' 'python-gobject')
makedepends=('meson')
checkdepends=('appstream-glib')
sha256sums=('57b18957adcfd5b0cb4b98601dce8cd3f8bd04d0b646905b5745cd2d1264cc7b')
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
