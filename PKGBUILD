# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname=ssl-admin
pkgver=1.2.1
pkgrel=2
pkgdesc="OpenSSL certificate manager with OpenVPN support"
arch=('any')
url="https://www.secure-computing.net"
license=('BSD3CLAUSE')
depends=('perl' 'openssl')
source=("http://distcache.FreeBSD.org/ports-distfiles/$pkgname-$pkgver.tar.xz")
sha256sums=('ebe6667c1beb79c7a12400e8a19bb4ec9f78ea7f72e0363d1eb10ed7f4b357ba')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
}

package() {
	cd "$pkgname-$pkgver"

	# Makefile does not do this so we will
	mkdir -p "$pkgdir/etc/ssl-admin"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/man/man1"
	mkdir -p "$pkgdir/usr/share/man/man5"
	make DESTDIR="$pkgdir/" install
}
