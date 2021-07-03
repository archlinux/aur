# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=mousai
pkgver=0.4.2
pkgrel=1
pkgdesc="Simple application for identifying songs"
arch=('x86_64')
url="https://github.com/SeaDve/Mousai"
license=('GPL3')
depends=('gstreamer' 'gtk4' 'libadwaita' 'python-gobject' 'python-requests')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f6955ee4c4d63cd9e176314ae6bba82cdf25d3fa5fb30c488c416e41ea9cddc8')

build() {
	arch-meson Mousai-$pkgver build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
