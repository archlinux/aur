# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=tcpkali
pkgver=0.6
pkgrel=1
pkgdesc="Fast multi-core TCP and WebSockets load generator."
arch=('i686' 'x86_64')
url="http://github.com/machinezone/tcpkali"
license=('custom')
source=("https://github.com/machinezone/$pkgname/releases/download/v$pkgver/${pkgname}-${pkgver}.tar.gz")
noextract=()
md5sums=('e94628c05c9b64f508de0ce61f1a4c3e')

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
