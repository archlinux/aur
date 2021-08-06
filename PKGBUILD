# Maintainer: Tom Tsagk <tomtsagk@darkdimension.org>
pkgname=avdl 
pkgdesc="Abstract video-game development language compiler"
pkgver=0.0.5
pkgrel=1
arch=('x86_64')
url="https://notabug.org/tomtsagk/$pkgname"
license=('GPL3')
depends=('sdl2' 'sdl2_mixer' 'freeglut' 'glew')
source=($pkgname-$pkgver.tar.gz::https://notabug.org/tomtsagk/$pkgname/archive/v$pkgver.tar.gz)
md5sums=('de31e7c90828a1bb569368ae13e20346')

build() {
	cd "$pkgname"
	make prefix=/usr
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" prefix=/usr install
}
