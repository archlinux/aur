# Maintainer: Tom Tsagk <tomtsagk@darkdimension.org>
pkgname=rue 
pkgdesc="A card game about deduction, love and regret"
pkgver=0.0.1
pkgrel=1
arch=('x86_64')
url="https://darkdimension.org/games/rue.html"
license=('GPL2')
makedepends=('avdl')
depends=('sdl2' 'sdl2_mixer' 'freeglut' 'glew')
source=(https://notabug.org/tomtsagk/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=('b18daa8a50f80de02862514a8a78c69f94001768841758e025feb4d032a0b4f3')

build() {
	cd "$pkgname"
	./configure --install-loc /usr/share/rue/
	make
}

package() {
	cd "$pkgname"
	make INSTALL_LOCATION_PREFIX=$pkgdir install
}
