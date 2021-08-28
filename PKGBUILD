# Maintainer: opale95
# Contributor: yochananmarqos
pkgname=lebiniou
pkgver=3.61.2
pkgrel=1
pkgdesc="User-friendly, powerful music visualization / VJing tool"
arch=('x86_64')
url="https://biniou.net"
license=('GPL')
depends=('libmagick6' 'fftw' 'sdl2' 'libcaca' 'ffmpeg' 'lebiniou-data>=3.61.0' 'ulfius')
makedepends=('uglify-js' 'nodejs-clean-css-cli' 'htmlmin')
source=("https://gitlab.com/lebiniou/lebiniou/-/archive/version-$pkgver/lebiniou-version-$pkgver.tar.gz")
sha256sums=('e300ce863473d03f4deace1c0feea54f42a2653788775fffe99fecaf201a861b')

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

