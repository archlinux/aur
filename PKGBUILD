# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Maintainer: dorkster <jajdorkster@gmail.com>

pkgname=flare-engine
pkgver=1.14
pkgrel=1
pkgdesc="Free/Libre Action Roleplaying Engine"
url="https://www.flarerpg.org/"
license=(GPL3)
arch=(i686 x86_64 aarch64)
makedepends=(cmake)
depends=(sdl2_image sdl2_mixer sdl2_ttf hicolor-icon-theme python)
source=("${pkgname}-${pkgver}::https://github.com/flareteam/flare-engine/archive/v${pkgver}.tar.gz")
sha256sums=('2c1bafeaa5ac26c10449bfcb7151b06e8a22547aa7364d2a39bbcb135aa50a09')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DBINDIR=bin -DDATADIR=share/flare
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR=$pkgdir
}
