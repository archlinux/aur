# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nuvola-app-soundcloud
pkgver=1.3
pkgrel=1
pkgdesc="SoundCloud integration for Nuvola Player"
arch=("i686" "x86_64")
url="https://github.com/tiliado/$pkgname"
license=('BSD' 'MIT' 'CCPL')
depends=('nuvolaplayer')
makedepends=('python-nuvolasdk' 'scour')
source=("https://github.com/tiliado/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('bf6cd6c9bdd9232f15cf3f3c07ef6c1ab8a1b7418087b36bd774fdf9a207b63b')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --with-dbus-launcher
	make all
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE-*.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
	make install DESTDIR="$pkgdir"
}
