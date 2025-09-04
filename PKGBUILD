# Maintainer: Gabriel Holmann <gholmann16 at gmail dot com>
pkgname=janus
pkgver=0.9.7
pkgrel=2
pkgdesc="Simple gtk notepad written in C"
url="https://github.com/gholmann16/janus"
arch=('any')
conflicts=('janus-gateway')
license=('GPL3')
depends=('gtk3' 'gtksourceview4')
makedepends=('meson')
source=("https://github.com/gholmann16/janus/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b7ed6cbf5a793abb440bf90995fd0628bb0fba8df8287a91e58f1c8e14e07088')
build() {
	cd "Janus-$pkgver"
	meson build --buildtype release --prefix /usr
	ninja -C build
}

package() {
	cd "Janus-$pkgver"
	DESTDIR=${pkgdir} meson install -C build
}
