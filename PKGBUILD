# Maintainer: stardust95
# Contributor: yochananmargos
pkgname=lebiniou
pkgver=3.56.1
pkgrel=1
pkgdesc="A tool to create images from sound"
arch=('x86_64')
url="https://biniou.net"
license=('GPL')
depends=('libmagick6' 'fftw' 'sdl2_ttf' 'libcaca' 'ffmpeg' 'lebiniou-data>=3.56.0' 'ulfius')
makedepends=('uglify-js' 'nodejs-clean-css-cli' 'htmlmin')
source=("https://gitlab.com/lebiniou/lebiniou/-/archive/version-$pkgver/lebiniou-version-$pkgver.tar.gz")
sha256sums=('be9533793c6e20186cb5b4d419f15e55a46d3e257140670157de2bde0a06c8ff')

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

