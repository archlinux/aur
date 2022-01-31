# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Maintainer: dorkster <jajdorkster@gmail.com>

pkgname=flare-engine
pkgver=1.13
pkgrel=1
pkgdesc="Free/Libre Action Roleplaying Engine"
url="http://www.flarerpg.org/"
license=(GPL3)
arch=(i686 x86_64 aarch64)
makedepends=(cmake)
depends=(sdl2_image sdl2_mixer sdl2_ttf hicolor-icon-theme python)
source=("${pkgname}-${pkgver}::https://github.com/flareteam/flare-engine/archive/v${pkgver}.tar.gz")
sha256sums=('c8e572a3ff71e4bbfad284dbd2a60f0434fa5ebd0d7d0d58a096eb7a0b6b3414')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DBINDIR=bin -DDATADIR=share/flare
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR=$pkgdir
}
