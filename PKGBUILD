# Maintainer: kraxarn <kraxie@protonmail.com>

pkgname=spotify-qt
pkgver=4.0.3
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
sha256sums=("a29963cf1c637da01dc675f5a0c1b927d3840f315f996d18ab9319045de5143a")

build() {
	cd "$srcdir"
	cmake -B build -S "$pkgname-$pkgver" -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
}
