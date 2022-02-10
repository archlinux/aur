# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: dorkster <jajdorkster@gmail.com>

pkgname=flare-game
pkgver=1.13.04
pkgrel=1
pkgdesc="Fantasy action RPG using the FLARE engine"
url="https://www.flarerpg.org/"
license=('CCPL:cc-by-sa-3.0')
arch=(any)
makedepends=(cmake)
depends=(flare-engine)
source=("${pkgname}-${pkgver}::https://github.com/flareteam/flare-game/archive/v${pkgver}.tar.gz")
sha256sums=('bbb278516c46e96ecc9b9470af3c37348ccb5dc61d33bd91c4823c090ccf2c78')
options=(!strip)

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DDATADIR=share/flare
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR=$pkgdir
}

