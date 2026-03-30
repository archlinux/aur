# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=crosspipe
pkgdesc='Visual PipeWire graph manager'
pkgver=0.1.1
pkgrel=1
url=https://github.com/dp0sk/crosspipe
license=(GPL-3.0-or-later)
arch=(x86_64)
depends=(libadwaita libgee libpipewire)
makedepends=(vala meson)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('fc5ea6fbf18816e92c39a93dd5ee25b6bf7128b2b7df957c5336412817dd5c61')

build () {
	rm -rf _build
	arch-meson "Crosspipe-$pkgver" _build
	meson compile -C _build
}

package () {
	meson install -C _build --destdir "$pkgdir"
}

check () {
	meson test -C _build
}
