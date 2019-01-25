# Maintainer: Radek Podgorny <radek@podgorny.cz>
# Contributor: Adam Caldwell <adam.caldwell@gmail.com>

pkgname=bwping
pkgver=1.10
pkgrel=1
pkgdesc="bandwidth measurement tool over icmp"
url="http://bwping.sourceforge.net/"
arch=('i686' 'x86_64' 'armv6h')
license=('BSD')

source=("http://downloads.sourceforge.net/project/bwping/bwping/${pkgver}/bwping-${pkgver}.tar.gz")
sha256sums=('2953e29501ec17684fd5b564bc0f8474b116676d79bb903019203af3a1e8eb25')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="${pkgdir}" install
}
