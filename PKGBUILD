# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=portfolio-file-manager
pkgver=0.9.3
pkgrel=1
pkgdesc="A minimalist file manager for those who want to use Linux mobile devices."
arch=('x86_64' 'aarch64')
url="https://github.com/tchx84/Portfolio"
license=('GPL3')
depends=('gtk3' 'libhandy' 'python-gobject')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('bcdf28531d2b085a417e7f9a83b196e66ef996b5b0f8ce106420216c06f70131')

build() {
	arch-meson Portfolio-$pkgver build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
