# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: houkime <houkime at protonmail.com>
pkgname=guile-chickadee
pkgver=0.10.0
pkgrel=1
pkgdesc="A game development toolkit for Guile Scheme"
arch=(x86_64)
url="https://dthompson.us/projects/chickadee.html"
license=('Apache-2.0')
depends=('freetype2'
         'guile>=3.0.6'
         'guile-sdl2>=0.8.0'
         'guile-opengl>=0.1.0'
         'libjpeg-turbo'
         'libpng'
         'libvorbis'
         'mpg123'
         'openal'
         'readline')
source=("https://files.dthompson.us/chickadee/${pkgname#guile-}-$pkgver.tar.gz")
sha256sums=('132f53b6e59a1a51c6d9c618c2a248b76457ed73545b6f0e1a5fe4b8f5020f75')


build(){
	cd "${pkgname#guile-}-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "${pkgname#guile-}-$pkgver"
	make DESTDIR="${pkgdir}/" install
}
