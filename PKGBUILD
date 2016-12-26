# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=tcpkali
pkgver=1.0
pkgrel=1
pkgdesc="Fast multi-core TCP and WebSockets load generator."
arch=('i686' 'x86_64')
url="http://github.com/machinezone/tcpkali"
license=('custom')
source=("https://github.com/machinezone/$pkgname/releases/download/v$pkgver/${pkgname}-${pkgver}.tar.gz")
noextract=()
md5sums=('7612a45df585e3077d07df37a6edd3df')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	autoreconf -iv
	./configure --prefix=/usr
	make
}

#check() {
#	cd "$srcdir/$pkgname-$pkgver"
#	make -k check
#}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
