# Maintainer: kraxarn <kraxie@protonmail.com>

pkgname=spotify-qt
pkgver=4.0.0
pkgrel=1
pkgdesc="Lightweight Spotify client using Qt"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/kraxarn/spotify-qt"
license=("GPL-3.0-only")
depends=(glibc gcc-libs qt6-base qt6-svg hicolor-icon-theme)
makedepends=(git cmake)
optdepends=(
	"librespot: Recommended playback client"
)
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=("358da63abf1bd0528c7b5e53aa72f2a5df265e9b0b4710cafefba0d0f633a672")

build() {
	cd "$srcdir"
	cmake -B build -S "$pkgname-$pkgver" -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr .
	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
}
