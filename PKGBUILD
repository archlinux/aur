# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gabtag
pkgver=1.6.0
pkgrel=1
pkgdesc="A Linux application to handle audio tags (Gtk3)"
arch=('x86_64')
url="https://github.com/lachhebo/GabTag"
license=('GPL3')
depends=('python-mutagen' 'python-cairo' 'python-musicbrainzngs'
         'python-pylyrics' 'python-gobject' 'python-pillow')
makedepends=('meson')
checkdepends=('appstream')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('aad4f5aee09ed87bd3d9023f1a074e3808b175ca0a0d1a7466ae1544a680c6dc')

build() {
	arch-meson "GabTag-$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
