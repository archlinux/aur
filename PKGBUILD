# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: dorkster <jajdorkster@gmail.com>

pkgname=flare-game
pkgver=1.06
pkgrel=1
pkgdesc="Fantasy action RPG using the FLARE engine - Git version"
url="http://www.flarerpg.org/"
license=('CCPL:cc-by-sa')
arch=(i686 x86_64)
makedepends=(cmake)
depends=(flare-engine)
source=("https://sourceforge.net/projects/flare-game/files/Linux/${pkgname}-v${pkgver}.tar.gz")
sha1sums=('0d3fed95dd48d4f0c42d44a057fb1f715f72893a')

build() {
	cd "$srcdir/$pkgname-v$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DDATADIR=share/flare
	make
}

package() {
	cd "$srcdir/$pkgname-v$pkgver"
	make install DESTDIR=$pkgdir
}

