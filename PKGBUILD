# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=portfolio-file-manager
pkgver=0.9.2
pkgrel=1
pkgdesc="A minimalist file manager for those who want to use Linux mobile devices."
arch=('x86_64' 'aarch64')
url="https://github.com/tchx84/Portfolio"
license=('GPL3')
depends=('gtk3' 'libhandy' 'python-gobject')
makedepends=('meson')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6af49794cd23f31475e1d04fda8a447544ccd8497a18ba84f0c269d0c417243c')

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
