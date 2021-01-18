# Maintainer: stardust95
# Contributor: yochananmargos
pkgname=lebiniou
pkgver=3.53.0
pkgrel=2
pkgdesc="A tool to create images from sound"
arch=('x86_64')
url="https://biniou.net"
license=('GPL')
depends=('libmagick6' 'fftw' 'sdl2_ttf' 'libcaca' 'ffmpeg' 'lebiniou-data' 'ulfius')
source=("https://gitlab.com/lebiniou/lebiniou/-/archive/version-$pkgver/lebiniou-version-$pkgver.tar.gz")
sha256sums=('a048c4482629ac6c65f3ecedbd2c32fb5e80b69c020c4633c7becc33444e43e1')

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

