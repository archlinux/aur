# Maintainer: Tom Tsagk <tomtsagk@darkdimension.org>
pkgname=avdl 
pkgdesc="Abstract video-game development language compiler"
pkgver=0.3.1
pkgrel=1
arch=('x86_64')
url="https://darkdimension.org/avdl.html"
license=('GPL3')
depends=('sdl2' 'sdl2_mixer' 'glew')
source=($pkgname-$pkgver.tar.gz::https://github.com/tomtsagk/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
md5sums=('f3ec9c24d0b8cb2bf6c1c6a015db4850')

build() {
	cd "$pkgname-$pkgver"
	make prefix=/usr
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" prefix=/usr install
}
