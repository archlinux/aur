# Mnaintainer: Kasei Wang <kasei@kasei.im>

pkgname=mesalink
pkgver=1.0.0
pkgrel=1
pkgdesc='A memory-safe and OpenSSL-compatible TLS library'
arch=('x86_64')
url='https://github.com/mesalock-linux/mesalink'
license=('custom:BSD')
makedepends=('rust')
source=("https://github.com/mesalock-linux/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('5339603cedd251df532f391402b8ac7c2b424eed82e64f5e6966107a753a19b9')
validpgpkeys=('8657ABB260F056B1E5190839D9C4D26D0E604491')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./autogen.sh --prefix=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
}
