# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gabtag
pkgver=2.1
pkgrel=1
pkgdesc="A Linux application to handle audio tags (Gtk3)"
arch=('x86_64')
url="https://github.com/lachhebo/GabTag"
license=('GPL3')
depends=('python-mutagen' 'python-cairo' 'python-musicbrainzngs'
         'python-pylyrics' 'python-gobject' 'python-pillow')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('396add7d55f1296e7561495a404bad02b528b2169e1030d0e2edd6ec245b0214')

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
