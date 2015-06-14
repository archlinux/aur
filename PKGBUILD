# Maintainer: Radek Podgorny <radek@podgorny.cz>

pkgname=bwping
pkgver=1.7
pkgrel=1
pkgdesc="bandwidth measurement tool over icmp"
url="https://http://bwping.sourceforge.net/"
arch=('i686' 'x86_64' 'armv6h')
license='BSD'

source=("http://downloads.sourceforge.net/project/bwping/bwping/${pkgver}/bwping-${pkgver}.tar.gz")
md5sums=('ce3015dde484d8ab485ef4352b30b244')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	#install -D -m755 mjpeg-grab "${pkgdir}/usr/bin/mjpeg-grab" || return 1
	make DESTDIR="${pkgdir}" install
}
