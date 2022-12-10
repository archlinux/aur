# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: dorkster <jajdorkster@gmail.com>

pkgname=flare-game
pkgver=1.14
pkgrel=1
pkgdesc="Fantasy action RPG using the FLARE engine"
url="https://www.flarerpg.org/"
license=('CCPL:cc-by-sa-3.0')
arch=(any)
makedepends=(cmake)
depends=(flare-engine)
source=("${pkgname}-${pkgver}::https://github.com/flareteam/flare-game/archive/v${pkgver}.tar.gz")
sha256sums=('65758462070aa88842084f8ee69083d8226e93cfbf83481663276d8307494b8e')
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

