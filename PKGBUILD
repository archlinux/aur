# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=tcpkali
pkgver=0.9
pkgrel=1
pkgdesc="Fast multi-core TCP and WebSockets load generator."
arch=('i686' 'x86_64')
url="http://github.com/machinezone/tcpkali"
license=('custom')
source=("https://github.com/machinezone/$pkgname/releases/download/v$pkgver/${pkgname}-${pkgver}.tar.gz")
noextract=()
md5sums=('53407166faac44d0aa78b3a185aa7605')

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
