# Maintainer: kraxarn <kraxie@protonmail.com>

pkgname=spotify-qt
pkgver=4.0.1
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
sha256sums=("75e735fa66eb7d20fd90a9600313a0bb78e071256e528554041641b6076a6b96")

build() {
	cd "$srcdir"
	cmake -B build -S "$pkgname-$pkgver" -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
}
