# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=liblc3
pkgver=1.0.1
pkgrel=1
pkgdesc="Low Complexity Communication Codec"
arch=(x86_64)
url="https://github.com/google/liblc3"
license=('Apache')
makedepends=(meson)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/google/liblc3/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3a8a6973c57585370dc9abe1373f8762f90ab0893a6ede410fdd22501caa7cfc')

build() {
	cd "$pkgname-$pkgver"

	rm -r build || true
	arch-meson build -Dtools=true
	meson compile -C build
}

package() {
	cd "$pkgname-$pkgver"

	meson install --destdir "$pkgdir" -C build
}
