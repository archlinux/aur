# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=millisecond
pkgver=0.2.3
pkgrel=1
pkgdesc="Optimize your Linux system for low latency audio"
arch=('any')
url="https://github.com/gaheldev/Millisecond"
license=('GPL-3.0-or-later')
depends=(hicolor-icon-theme gtk4 python-gobject dconf python libadwaita glib2)
makedepends=(meson ninja)
provides=()
conflicts=()
replaces=()
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('0b3a1b67d187db16f553ee9ba8aec19f2f66203da488f4d50c665eacefc46ba1')
validpgpkeys=()

prepare() {
	cd "${pkgname/m/M}-$pkgver"
}

build() {
	cd "$srcdir"
	arch-meson "${pkgname/m/M}-$pkgver" build
	meson compile -C build
}

package() {
	cd "$srcdir"
	meson install -C build --destdir="$pkgdir"
}
