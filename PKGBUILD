# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: dorkster <jajdorkster@gmail.com>

pkgname=flare-engine
pkgver=1.10
pkgrel=1
pkgdesc="Free/Libre Action Roleplaying Engine"
url="http://www.flarerpg.org/"
license=(GPL3)
arch=(i686 x86_64)
makedepends=(cmake)
depends=(sdl2_image sdl2_mixer sdl2_ttf hicolor-icon-theme python)
source=("${pkgname}-${pkgver}::https://github.com/flareteam/flare-engine/archive/v${pkgver}.tar.gz")
sha1sums=('1c5254009c7729d61c8b12a0a2f0397b0ea2cf46')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DBINDIR=bin -DDATADIR=share/flare
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR=$pkgdir
}
