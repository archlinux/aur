# Maintainer: opale95
# Contributor: yochananmarqos
pkgname=lebiniou
pkgver=3.60.1
pkgrel=1
pkgdesc="User-friendly, powerful music visualization / VJing tool"
arch=('x86_64')
url="https://biniou.net"
license=('GPL')
depends=('libmagick6' 'fftw' 'sdl2_ttf' 'libcaca' 'ffmpeg' 'lebiniou-data>=3.60.0' 'ulfius')
makedepends=('uglify-js' 'nodejs-clean-css-cli' 'htmlmin')
source=("https://gitlab.com/lebiniou/lebiniou/-/archive/version-$pkgver/lebiniou-version-$pkgver.tar.gz")
sha256sums=('f5f9bbe48d06436efaab578d78c81b2326fb6a1ec536e6cbf74ca19492854a1a')

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

