# Maintainer: opale95
# Contributor: yochananmarqos
pkgname=lebiniou
pkgver=3.63.2
pkgrel=1
pkgdesc="User-friendly, powerful music visualization / VJing tool"
arch=('x86_64' 'pentium4' 'i686')
url="https://biniou.net"
license=('GPL')
depends=('libmagick6' 'fftw' 'sdl2' 'libcaca' 'ffmpeg' 'lebiniou-data>=3.62.0' 'ulfius')
source=("https://gitlab.com/lebiniou/lebiniou/-/archive/version-$pkgver/lebiniou-version-$pkgver.tar.gz")
sha256sums=('a227ce3827a0b8b620257e61cb170e7e63182743acab222e627562a296ebab5a')

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

