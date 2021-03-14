# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=kooha
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple screen recorder for GNOME"
arch=('x86_64')
url="https://github.com/SeaDve/Kooha"
license=('GPL3')
depends=('gstreamer' 'gtk3' 'libhandy' 'python-gobject')
makedepends=('meson')
#checkdepends=('appstream-glib')
sha256sums=('6199ce69f64ec8fa8aeab1ef708cc3257bc59caa885840b433006f183a59c20f')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")

build() {
	arch-meson Kooha-$pkgver build
	meson compile -C build
}

#check() {
#	meson test -C build
#}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
