# Maintainer: Tom Tsagk <tomtsagk@darkdimension.org>
pkgname=avdl 
pkgdesc="Abstract video-game development language compiler"
pkgver=0.0.1
pkgrel=2
arch=('x86_64')
url="https://notabug.org/tomtsagk/$pkgname"
license=('GPL3')
depends=('sdl2' 'sdl2_mixer' 'freeglut' 'glew')
source=($pkgname-$pkgver.tar.gz::https://notabug.org/tomtsagk/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('c5bf61b83fc5c25b02686b28beddaca6')

build() {
	cd "$pkgname"
	./configure
	make engine
	make
}

package() {
	cd "$pkgname"
	make INSTALL_LOCATION="$pkgdir" install
}
