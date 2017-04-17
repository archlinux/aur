# Maintainer: Radek Podgorny <radek@podgorny.cz>
# Contributor: Adam Caldwell <adam.caldwell@gmail.com>

pkgname=bwping
pkgver=1.9
pkgrel=1
pkgdesc="bandwidth measurement tool over icmp"
url="http://bwping.sourceforge.net/"
arch=('i686' 'x86_64' 'armv6h')
license=('BSD')

source=("http://downloads.sourceforge.net/project/bwping/bwping/${pkgver}/bwping-${pkgver}.tar.gz")
sha256sums=('3827f9256e9da5c22c62530d800438f0111986a8f1fad84c7bdb924d630f0090')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="${pkgdir}" install
}