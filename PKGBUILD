# Maintainer: Gabriel Holmann <gholmann16 at gmail dot com>
pkgname=janus
pkgver=0.9.8
pkgrel=1
pkgdesc="Simple text editor"
url="https://github.com/gholmann16/janus"
arch=('x86_64' 'aarch64' 'armv7h' 'riscv64' 'i686')
conflicts=('janus-gateway')
license=('GPL-3.0-only')
depends=('gtk3' 'gtksourceview4')
makedepends=('meson')
source=("https://github.com/gholmann16/janus/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1fde4cb5066b145d07c718b261a42f3e99a75016c3e188c2ca4d4e9aca033350')

build() {
	cd "Janus-$pkgver"
	meson build --buildtype release --prefix /usr
	ninja -C build
}

package() {
	cd "Janus-$pkgver"
	DESTDIR=${pkgdir} meson install -C build
}
