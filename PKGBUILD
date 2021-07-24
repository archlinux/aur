# Maintainer: Tom Tsagk <tomtsagk@darkdimension.org>
pkgname=avdl 
pkgdesc="Abstract video-game development language compiler"
pkgver=0.0.0
pkgrel=1
arch=('x86_64')
url="https://darkdimension.org/"
license=('GPL3')
depends=('sdl2' 'sdl2_mixer' 'freeglut' 'glew')
source=(https://notabug.org/tomtsagk/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('04b7d79031597ad46108d984beb79353')

build() {
	cd "$pkgname"
	./configure
	make engine
	make
}

package() {
	cd "$pkgname"
	make INSTALL_LOCATION=$pkgdir install
}
