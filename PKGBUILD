# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: dorkster <jajdorkster@gmail.com>

pkgname=flare-game
pkgver=1.12
pkgrel=2
pkgdesc="Fantasy action RPG using the FLARE engine"
url="http://www.flarerpg.org/"
license=('CCPL:cc-by-sa-3.0')
arch=(any)
makedepends=(cmake)
depends=(flare-engine)
source=("${pkgname}-${pkgver}::https://github.com/flareteam/flare-game/archive/v${pkgver}.tar.gz")
sha256sums=('19a909f2c6e0868baae823bb491e8840d5fb3e0454f00201de8da119772e5160')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DDATADIR=share/flare
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR=$pkgdir
}

