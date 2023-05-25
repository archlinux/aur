# Maintainer: Tom Tsagkatos <tomtsagkatos@afloof.dev>
pkgname=rue
pkgdesc="A card game about deduction, love and regret"
pkgver=1.0.7
pkgrel=1
arch=('x86_64')
url="https://afloofdev.com/games/rue"
license=('GPL3')
makedepends=('avdl')
depends=('sdl2' 'sdl2_mixer' 'glew')
source=($pkgname-$pkgver.tar.gz::https://github.com/tomtsagk/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
md5sums=('95ce37d29929dbae365f008bda46cc71')

build() {
	cd "$pkgname-$pkgver"
	avdl --makefile
	make prefix=/usr
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" prefix=/usr install
}
