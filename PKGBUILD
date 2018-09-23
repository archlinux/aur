# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: dorkster <jajdorkster@gmail.com>

pkgname=flare-game
pkgver=1.08
pkgrel=1
pkgdesc="Fantasy action RPG using the FLARE engine - Git version"
url="http://www.flarerpg.org/"
license=('CCPL:cc-by-sa')
arch=(i686 x86_64)
makedepends=(cmake)
depends=(flare-engine)
source=("https://sourceforge.net/projects/flare-game/files/Linux/${pkgname}-v${pkgver}.tar.gz")
sha1sums=('c9400ed0fe1e3677e87d826fb954d02f8ae819ea')

build() {
	cd "$srcdir/$pkgname-v$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DDATADIR=share/flare
	make
}

package() {
	cd "$srcdir/$pkgname-v$pkgver"
	make install DESTDIR=$pkgdir
}

