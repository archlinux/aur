# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: dorkster <jajdorkster@gmail.com>

pkgname=flare-game
pkgver=1.13
pkgrel=2
pkgdesc="Fantasy action RPG using the FLARE engine"
url="http://www.flarerpg.org/"
license=('CCPL:cc-by-sa-3.0')
arch=(any)
makedepends=(cmake)
depends=(flare-engine)
source=("${pkgname}-${pkgver}::https://github.com/flareteam/flare-game/archive/v${pkgver}.tar.gz")
sha256sums=('39366e3cd20e22c818d088051a2e2ef0c31e63d1cefea64b92b58fa6a98993b0')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DDATADIR=share/flare
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR=$pkgdir
}

