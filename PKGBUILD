# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: dorkster <jajdorkster@gmail.com>

pkgname=flare-game
pkgver=1.09
pkgrel=1
pkgdesc="Fantasy action RPG using the FLARE engine"
url="http://www.flarerpg.org/"
license=('CCPL:cc-by-sa')
arch=(i686 x86_64)
makedepends=(cmake)
depends=(flare-engine)
source=("${pkgname}-${pkgver}::https://github.com/flareteam/flare-game/archive/v${pkgver}.tar.gz")
sha1sums=('f78e23f28c97127880d500ac1aad77c777a6f963')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DDATADIR=share/flare
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR=$pkgdir
}

