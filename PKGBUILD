# Maintainer: Tom Tsagk <tomtsagk@darkdimension.org>
pkgname=avdl 
pkgdesc="Abstract video-game development language compiler"
pkgver=0.2.1
pkgrel=1
arch=('x86_64')
url="https://darkdimension.org/avdl.html"
license=('GPL3')
depends=('sdl2' 'sdl2_mixer' 'glew')
source=($pkgname-$pkgver.tar.gz::https://github.com/tomtsagk/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
md5sums=('ab6a2bdb67f347d85b1d6aa405ea510e')

build() {
	cd "$pkgname-$pkgver"
	make prefix=/usr
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" prefix=/usr install
}
