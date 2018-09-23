# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: dorkster <jajdorkster@gmail.com>

pkgname=flare-engine
pkgver=1.08
pkgrel=1
pkgdesc="Free/Libre Action Roleplaying Engine - Git version"
url="http://www.flarerpg.org/"
license=(GPL3)
arch=(i686 x86_64)
makedepends=(cmake)
depends=(sdl2_image sdl2_mixer sdl2_ttf hicolor-icon-theme python)
source=("https://sourceforge.net/projects/flare-game/files/Linux/${pkgname}-v${pkgver}.tar.gz")
sha1sums=('e24bd9ab804f99fe6dbde3fd86334261ac665e03')

build() {
	cd "$srcdir/$pkgname-v$pkgver"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DBINDIR=bin -DDATADIR=share/flare
	make
}

package() {
	cd "$srcdir/$pkgname-v$pkgver"
	make install DESTDIR=$pkgdir
}
