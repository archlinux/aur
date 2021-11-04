# Maintainer: opale95
# Contributor: yochananmarqos
pkgname=lebiniou
pkgver=3.63.0
pkgrel=2
pkgdesc="User-friendly, powerful music visualization / VJing tool"
arch=('x86_64' 'pentium4' 'i686')
url="https://biniou.net"
license=('GPL')
depends=('libmagick6' 'fftw' 'sdl2' 'libcaca' 'ffmpeg' 'lebiniou-data>=3.62.0' 'ulfius')
source=("https://gitlab.com/lebiniou/lebiniou/-/archive/version-$pkgver/lebiniou-version-$pkgver.tar.gz")
sha256sums=('2ccd95ae12082602f809e4f813ed7d3408e60a5868cb9f02dfb7865866763cec')

build() {
	cd "$pkgname-version-$pkgver"
	./bootstrap
	export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/lib/imagemagick6/pkgconfig"
	./configure --prefix=/usr --disable-caca
	make
}

package() {
	cd "$pkgname-version-$pkgver"
	make DESTDIR="$pkgdir/" install
}

