# Maintainer: Tom Tsagk <tomtsagk@darkdimension.org>
pkgname=rue 
pkgdesc="A card game about deduction, love and regret"
pkgver=0.0.6
pkgrel=1
arch=('x86_64')
url="https://darkdimension.org/games/rue.html"
license=('GPL3')
makedepends=('avdl')
depends=('sdl2' 'sdl2_mixer' 'glew')
source=($pkgname-$pkgver.tar.gz::https://github.com/tomtsagk/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
md5sums=('2a0e3813f885398dff70cb1566ce2516')

build() {
	cd "$pkgname-$pkgver"
	make prefix=/usr
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" prefix=/usr install
}
