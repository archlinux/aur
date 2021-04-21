# Maintainer:  Thomas Weißschuh <thomas t-8ch de>

pkgname=pinentry-bemenu
pkgver=0.5.0
pkgrel=1
pkgdesc="Pinentry based on bemenu"
arch=(x86_64)
url=https://github.com/t-8ch/pinentry-bemenu
license=(GPL2)
provides=(pinentry)
depends=(bemenu libassuan libgpg-error)
makedepends=(meson)
source=(
	pinentry-bemenu-$pkgver.tar.gz::https://github.com/t-8ch/$pkgname/archive/refs/tags/v$pkgver.tar.gz
)
sha256sums=('d7a5e71bc72270aa306adcaf1ba21b635a8719bd545b7cabd85b604975b92bb3')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	arch-meson build
	cd build
	ninja
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"
	DESTDIR="$pkgdir" ninja install
}
