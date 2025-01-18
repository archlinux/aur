# Maintainer: Maarten Bezemer <maarten.bezemer@gmail.com>

pkgname=plasma6-runners-emojirunner
pkgver=3.0.4
pkgrel=1
pkgdesc="Search for emojis in Krunner and copy/paste them"
arch=('x86_64')
url=https://github.com/alex1701c/EmojiRunner
license=(GLP3)
depends=(xdotool krunner)
makedepends=(cmake extra-cmake-modules ki18n kcmutils)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('e2af1b6de1ec21770739263e3936eab54b623e191325733c282e8a25da3245a9')
install=plasma6-runners-emojirunner.install

build() {
	cmake -B build -S "EmojiRunner-$pkgver" \
		-Wno-dev \
		-DCMAKE_SKIP_RPATH=YES \
		-DCMAKE_BUILD_TYPE=None \
		-DBUILD_WITH_QT6=ON
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
