# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libspng
pkgver=0.7.2
pkgrel=1
pkgdesc='C library for reading and writing PNG format files with a focus on security and ease of use'
arch=(x86_64 aarch64)
url='https://libspng.org/'
license=(BSD)
depends=(zlib)
makedepends=(meson)
source=("libspng-${pkgver}.tar.gz::https://github.com/randy408/libspng/archive/v${pkgver}.tar.gz")
b2sums=('f6721c15b4ab9118e659d565ddd37fac9d2ceacf96dfe334c90a1c7d2ddf12ebfb6d216b8b6bb5a9c4c2e0acbdbac8574e7d036948e67c7d2484e98862bafa12')

build() {
	arch-meson build "libspng-${pkgver}"
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	install -D "libspng-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/libspng/LICENSE"
}
