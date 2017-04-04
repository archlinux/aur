# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nuvola-app-bandcamp
pkgver=2.2
pkgrel=1
pkgdesc="Bandcamp integration for Nuvola Player."
arch=("i686" "x86_64")
url="https://github.com/tiliado/nuvola-app-bandcamp"
license=('BSD')
depends=('nuvolaplayer')
makedepends=('python-nuvolasdk' 'scour')
source=("https://github.com/tiliado/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('ac5cc93361f7c3ae03edbb1fb7eb804811fa54399341b8c049878936e9ff0ce5')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --with-dbus-launcher
	make all
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
	make install DESTDIR="$pkgdir"
}
