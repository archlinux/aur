# Maintainer: Dane Johnson <dane@danejohnson.org>
pkgname=chickadee
pkgver=0.10.0
pkgrel=1
pkgdesc="A game development toolkit for Guile Scheme."
arch=('any')
url="https://dthompson.us/projects/chickadee.html"
license=('GPL')
depends=('guile>=3.0.6' 'guile-sdl2>=0.8.0' 'guile-opengl' 'libjpeg-turbo' 'libpng' 'openal' 'libvorbis' 'mpg123' 'freetype2' 'readline')
source=("https://files.dthompson.us/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('02bcf23aa4bc4e2ca0ae6515a4693923')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
