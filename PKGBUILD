# Maintainer: Kasei Wang <kasei@kasei.im>

pkgname=mesalink
pkgver=0.6.1
pkgrel=1
pkgdesc='A memory-safe and OpenSSL-compatible TLS library'
arch=('x86_64')
url='https://github.com/mesalock-linux/mesalink'
license=('custom:BSD')
makedepends=('rust')
source=("https://github.com/mesalock-linux/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ef9e4033c1bb9efe45c97bd071d6baef059aba7275e080545b2f92ececd5fd4b')
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
