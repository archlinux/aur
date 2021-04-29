# Maintainer:  Thomas Weißschuh <thomas t-8ch de>

pkgname=pinentry-bemenu
pkgver=0.6.0
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
sha256sums=('933ba1740e94a5e775057c0536e17d18f3fd693de74f4b23b338953af88979da')

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
