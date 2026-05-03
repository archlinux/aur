# Maintainer: kraxarn <kraxie@protonmail.com>

pkgname=spotify-qt
pkgver=4.0.4
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
sha256sums=("10656f4c980c8d4b90f11879a6a58fe542e8b0ef1212297a700bcde3d9a6e396")

build() {
	cd "$srcdir"
	cmake -B build -S "$pkgname-$pkgver" -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
}
