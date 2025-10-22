# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=millisecond
pkgver=0.2.0
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
sha256sums=('c778b585d42100fb71546d4cbbc26dcfa03ab68e6fb9bec7f04743e906cdd928')
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
