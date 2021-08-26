# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Francois Boulogne <fboulogne at april dot org>
# Contributor: Gaetan Bisson <bisson@archlinux.org>

pkgname=libdivecomputer
pkgver=0.7.0
pkgrel=1
pkgdesc='Library for communication with dive computers'
url='https://www.libdivecomputer.org/'
license=('LGPL')
arch=('i686' 'x86_64')
depends=('glibc')
provides=('libdivecomputer.so=0-64')
source=("$pkgname-$pkgver.tar.gz::https://github.com/libdivecomputer/libdivecomputer/archive/v$pkgver.tar.gz")
sha256sums=('26b3fcea8d0fe694456aa4ebe35da2902f109a0916693569c32a85a265ae53d2')

build() {
	cd "$pkgname-$pkgver"
	autoreconf -i
	./configure \
		--prefix=/usr \
		--program-prefix="libdivecomputer-"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="${pkgdir}" install
}
