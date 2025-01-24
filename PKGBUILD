# Maintainer: Maarten Bezemer <maarten.bezemer@gmail.com>

pkgname=plasma6-runners-emojirunner
pkgver=3.0.5
pkgrel=1
pkgdesc="Search for emojis in Krunner and copy/paste them"
arch=('x86_64')
url=https://github.com/alex1701c/EmojiRunner
license=(GLP3)
depends=(xdotool krunner)
makedepends=(cmake extra-cmake-modules ki18n kcmutils)
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('4bf4b1bccf655e41346d5ad203dc857acb0236d3b5e62be7510e54fab0377bd8')
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
