# Maintainer: stardust95
# Contributor: yochananmargos
pkgname=lebiniou
pkgver=3.53.0
pkgrel=1
pkgdesc="A tool to create images from sound"
arch=('x86_64')
url="https://biniou.net"
license=('GPL')
depends=('libmagick6' 'fftw' 'sdl2_ttf' 'libcaca' 'ffmpeg' 'lebiniou-data' 'ulfius')
source=("https://gitlab.com/lebiniou/lebiniou/-/archive/version-$pkgver/lebiniou-version-$pkgver.tar.gz")
sha256sums=('9098d596753550f966a7eb12b2f7513805605cf5e5ca3a53ad2ba66cc188bed3')

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

