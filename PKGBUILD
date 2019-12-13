# Maintainer: Radek Podgorny <radek@podgorny.cz>
# Contributor: Adam Caldwell <adam.caldwell@gmail.com>

pkgname=bwping
pkgver=1.16
pkgrel=1
pkgdesc="bandwidth measurement tool over icmp"
url="http://bwping.sourceforge.net/"
arch=('x86_64')
license=('BSD')

source=("http://downloads.sourceforge.net/project/bwping/bwping/${pkgver}/bwping-${pkgver}.tar.gz")
sha256sums=('c0a0c61f779d7b497bfc264103614d013002e74502a868d678e8b569a3017687')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="${pkgdir}" install
}
