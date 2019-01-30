# Maintainer: Kasei Wang <kasei@kasei.im>

pkgname=mesalink
pkgver=0.8.0
pkgrel=1
pkgdesc='A memory-safe and OpenSSL-compatible TLS library'
arch=('x86_64')
url='https://github.com/mesalock-linux/mesalink'
license=('custom:BSD')
makedepends=('rust')
source=("https://github.com/mesalock-linux/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('2ef5380e483b6b9a54eb8919f04dc3855a99598fd2cfe6c1f779992d999540fd')
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
