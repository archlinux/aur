# Maintainer: Leandro Vital <leandro em lvital ponto com>
pkgname=inkaur
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple, lightweight, and fast AUR helper written in C"
arch=('x86_64')
url="https://github.com/lvitals/inkaur"
license=('MIT')
depends=('curl' 'pacman')
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
