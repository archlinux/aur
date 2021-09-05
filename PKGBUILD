# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Maintainer: dorkster <jajdorkster@gmail.com>

pkgname=flare-engine
pkgver=1.12
pkgrel=1
pkgdesc="Free/Libre Action Roleplaying Engine"
url="http://www.flarerpg.org/"
license=(GPL3)
arch=(i686 x86_64 aarch64)
makedepends=(cmake)
depends=(sdl2_image sdl2_mixer sdl2_ttf hicolor-icon-theme python)
source=("${pkgname}-${pkgver}::https://github.com/flareteam/flare-engine/archive/v${pkgver}.tar.gz")
sha256sums=('287a08532972fa3ac56ce7cb213d21be8be35b529339f61d4eeadbd501c78a8e')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr -DBINDIR=bin -DDATADIR=share/flare
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR=$pkgdir
}
