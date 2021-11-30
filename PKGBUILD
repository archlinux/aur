# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=libspng
pkgver=0.7.1
pkgrel=1
pkgdesc='C library for reading and writing PNG format files with a focus on security and ease of use'
arch=(x86_64 aarch64)
url='https://libspng.org/'
license=(BSD)
depends=(zlib)
makedepends=(meson)
source=("libspng-${pkgver}.tar.gz::https://github.com/randy408/libspng/archive/v${pkgver}.tar.gz")
sha256sums=('0726a4914ad7155028f3baa94027244d439cd2a2fbe8daf780c2150c4c951d8e')

build() {
	arch-meson build "libspng-${pkgver}"
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	install -D "libspng-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/libspng/LICENSE"
}
