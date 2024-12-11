# Maintainer: kraxarn <kraxie@protonmail.com>

pkgname=spotify-qt
pkgver=3.12
pkgrel=1
pkgdesc="Lightweight Spotify client using Qt"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/kraxarn/spotify-qt"
license=("GPL3")
depends=(qt5-base qt5-svg hicolor-icon-theme)
makedepends=(git cmake gcc make)
optdepends=(
	"librespot: Recommended playback client"
	"spotifyd: Recommended playback client"
)
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=("5782ff9cd854aa92b4ba49837d3ed4b5ada0427fd440e16866e9727abcd9df62")

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
	make $MAKEFLAGS
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}