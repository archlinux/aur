# Maintainer: Radek Podgorny <radek@podgorny.cz>
# Contributor: Adam Caldwell <adam.caldwell@gmail.com>

pkgname=bwping
pkgver=1.15
pkgrel=1
pkgdesc="bandwidth measurement tool over icmp"
url="http://bwping.sourceforge.net/"
arch=('i686' 'x86_64' 'armv6h')
license=('BSD')

source=("http://downloads.sourceforge.net/project/bwping/bwping/${pkgver}/bwping-${pkgver}.tar.gz")
sha256sums=('ed40b5f56da61830734f1a1aa967ad7fd9f7b3a2e688ca9ff2d509156c14b37d')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="${pkgdir}" install
}
