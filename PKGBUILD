# Maintainer: stardust95
# Contributor: yochananmargos
pkgname=lebiniou
pkgver=3.53.3
pkgrel=1
pkgdesc="A tool to create images from sound"
arch=('x86_64')
url="https://biniou.net"
license=('GPL')
depends=('libmagick6' 'fftw' 'sdl2_ttf' 'libcaca' 'ffmpeg' 'lebiniou-data' 'ulfius')
source=("https://gitlab.com/lebiniou/lebiniou/-/archive/version-$pkgver/lebiniou-version-$pkgver.tar.gz")
sha256sums=('5f063445ce0e318518ab645729d236ffe92395a726426773361e17d8e04a6e6f')

build() {
	cd "$pkgname-version-$pkgver"
	./bootstrap
	export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/lib/imagemagick6/pkgconfig"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-version-$pkgver"
	make DESTDIR="$pkgdir/" install
}

