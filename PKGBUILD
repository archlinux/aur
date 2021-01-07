# Maintainer: stardust95
# Contributor: yochananmargos
pkgname=lebiniou
pkgver=3.52.0
pkgrel=2
pkgdesc="A tool to create images from sound"
arch=('x86_64')
url="https://biniou.net"
license=('GPL')
depends=('libmagick6' 'fftw' 'sdl2_ttf' 'libcaca' 'ffmpeg' 'lebiniou-data' 'ulfius')
source=("https://gitlab.com/lebiniou/lebiniou/-/archive/version-$pkgver/lebiniou-version-$pkgver.tar.gz")
sha256sums=('bdb881210b2327ffbb9fcd7de9df08a4ee631a9f409b5aadc3570e9777363209')

build() {
	cd "$pkgname-version-$pkgver"
	autoreconf -i
	export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/lib/imagemagick6/pkgconfig"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-version-$pkgver"
	make DESTDIR="$pkgdir/" install
}

