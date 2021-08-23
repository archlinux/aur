# Maintainer: opale95
# Contributor: yochananmarqos
pkgname=lebiniou
pkgver=3.61.1
pkgrel=1
pkgdesc="User-friendly, powerful music visualization / VJing tool"
arch=('x86_64')
url="https://biniou.net"
license=('GPL')
depends=('libmagick6' 'fftw' 'sdl2' 'libcaca' 'ffmpeg' 'lebiniou-data>=3.61.0' 'ulfius')
makedepends=('uglify-js' 'nodejs-clean-css-cli' 'htmlmin')
source=("https://gitlab.com/lebiniou/lebiniou/-/archive/version-$pkgver/lebiniou-version-$pkgver.tar.gz")
sha256sums=('4a4aed87c0d95b0dd149705b92d1337ce099a1a46c8752f409fec68d186ed13b')

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

