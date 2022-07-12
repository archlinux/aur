# Maintainer: kraxarn <kraxie@protonmail.com>

pkgname=spotify-qt
pkgver=3.9
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
sha256sums=("db1bc50fe4f31fc021db722eb85e59db543a104255a0a07f2e923d7a69195e42")

build() {
	cd "$pkgname-$pkgver"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
	make $MAKEFLAGS
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}