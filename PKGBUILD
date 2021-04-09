# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=kooha
pkgver=1.1.1
pkgrel=1
pkgdesc="Simple screen recorder for GNOME"
arch=('x86_64')
url="https://github.com/SeaDve/Kooha"
license=('GPL3')
depends=('gstreamer' 'gtk3' 'libhandy' 'python-gobject')
makedepends=('meson')
checkdepends=('appstream-glib')
sha256sums=('7087a268e02c27d47fa30fd761f05c36135bbb3aa80d80ab89ef0708f0559fd3')
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
