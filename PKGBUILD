# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=tcpkali
pkgver=0.7
pkgrel=1
pkgdesc="Fast multi-core TCP and WebSockets load generator."
arch=('i686' 'x86_64')
url="http://github.com/machinezone/tcpkali"
license=('custom')
source=("https://github.com/machinezone/$pkgname/releases/download/v$pkgver/${pkgname}-${pkgver}.tar.gz")
noextract=()
md5sums=('d3c2bbd851e608bff74b7084a2bb4b95')

build() {
	cd "$srcdir/$pkgname-$pkgver"
  autoreconf -iv
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
