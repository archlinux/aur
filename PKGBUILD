# Maintainer: kraxarn <me@kraxarn.com>

pkgname=spotify-qt
pkgver=0.12
pkgrel=2
pkgdesc="Lightweight Spotify client using Qt"
arch=(x86_64)
url="https://github.com/kraxarn/spotify-qt"
license=("GPL3")
depends=(qt5-base qt5-svg)
makedepends=(git cmake gcc make)
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=("0c99a7301b10386feeeb1b1c742b0028f0fa3433d9fb6865e55792961ad2dedb")

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
	make $MAKEFLAGS
}

package() {
	cd "$pkgname-$pkgver"
	#cp spotify-qt "$pkgdir"/usr/bin
	make DESTDIR="$pkgdir" install
}