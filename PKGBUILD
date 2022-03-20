# Maintainer: opale95
# Contributor: yochananmarqos
pkgname=lebiniou
pkgver=3.66.0
pkgrel=1
pkgdesc="User-friendly, powerful music visualization / VJing tool"
arch=('x86_64' 'pentium4' 'i686')
url="https://biniou.net"
license=('GPL')
depends=('libmagick6' 'fftw' 'sdl2' 'libcaca' 'ffmpeg' 'lebiniou-data>=3.66.0' 'ulfius')
source=("https://gitlab.com/lebiniou/lebiniou/-/archive/version-$pkgver/lebiniou-version-$pkgver.tar.gz")
sha256sums=('6947efddb4abb2ea5fd3eb2610955bbd4aafaf7a9bb6ce95ac8012af7e524e0a')

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

