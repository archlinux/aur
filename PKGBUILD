# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=mousai
pkgver=0.3.2
pkgrel=1
pkgdesc="Simple application for identifying songs"
arch=('x86_64')
url="https://github.com/SeaDve/Mousai"
license=('GPL3')
depends=('gstreamer' 'gtk3' 'libhandy' 'python-gobject' 'python-requests')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fbc4bd09ce5e574a030878c1d30fd4d2fdda9034a9c373de83d6d335f50abcfc')

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
