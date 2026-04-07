# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=millisecond
pkgver=0.2.1
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
sha256sums=('5ec01c93f8fb29b32ef3fdce319f90168d557862e86210146f0579f741936dd3')
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
