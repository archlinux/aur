# Maintainer: kraxarn <me@kraxarn.com>

pkgname=spotify-qt
pkgver=0.12
pkgrel=3
pkgdesc="Lightweight Spotify client using Qt"
arch=(x86_64)
url="https://github.com/kraxarn/spotify-qt"
license=("GPL3")
depends=(qt5-base qt5-svg)
makedepends=(git cmake gcc make)
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=("c4e98757642c2f2949bbfda6521ad4ffed831c3fdd523ea8796157c59344b675")

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DGIT_TAG=v$pkgver .
	make $MAKEFLAGS
}

package() {
	cd "$pkgname-$pkgver"
	#cp spotify-qt "$pkgdir"/usr/bin
	make DESTDIR="$pkgdir" install
}