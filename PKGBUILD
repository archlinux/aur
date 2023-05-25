# Maintainer: Tom Tsagkatos <tomtsagkatos@afloof.dev>
pkgname=avdl 
pkgdesc="Abstract video-game development language compiler"
pkgver=0.9.8
pkgrel=1
arch=('x86_64')
url="https://afloofdev.com/avdl"
license=('GPL3')
depends=('sdl2' 'sdl2_mixer' 'glew')
source=($pkgname-$pkgver.tar.gz::https://github.com/tomtsagk/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
md5sums=('bfe35f96d5bab46abc1e1af4a53860fc')

build() {
	cd "$pkgname-$pkgver"
	make prefix=/usr
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" prefix=/usr install
}
