# Maintainer: Radek Podgorny <radek@podgorny.cz>
# Contributor: Adam Caldwell <adam.caldwell@gmail.com>

pkgname=bwping
pkgver=1.12
pkgrel=1
pkgdesc="bandwidth measurement tool over icmp"
url="http://bwping.sourceforge.net/"
arch=('i686' 'x86_64' 'armv6h')
license=('BSD')

source=("http://downloads.sourceforge.net/project/bwping/bwping/${pkgver}/bwping-${pkgver}.tar.gz")
sha256sums=('79f84a7e7dc787931de578fe5fe53c17daa9cb009f25f0eb198db2504b48e054')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make DESTDIR="${pkgdir}" install
}
