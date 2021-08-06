# Maintainer: Tom Tsagk <tomtsagk@darkdimension.org>
pkgname=rue 
pkgdesc="A card game about deduction, love and regret"
pkgver=0.0.4
pkgrel=1
arch=('x86_64')
url="https://darkdimension.org/games/rue.html"
license=('GPL2')
makedepends=('avdl')
depends=('sdl2' 'sdl2_mixer' 'freeglut' 'glew')
source=($pkgname-$pkgver.tar.gz::https://notabug.org/tomtsagk/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('104074005940106a60378982e6f589978c8754610ed5a9b39b6d7a2a9d4ea324')

build() {
	cd "$pkgname"
	make prefix=/usr
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" prefix=/usr install
}
